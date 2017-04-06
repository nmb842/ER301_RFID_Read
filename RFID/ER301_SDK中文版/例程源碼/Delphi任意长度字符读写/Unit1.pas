unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,declaredll,strutils;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    cb_kh: TComboBox;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    lb_info: TLabel;
    Label3: TLabel;
    cb_port: TComboBox;
    Label4: TLabel;
    cb_baud: TComboBox;
    rg_key: TRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    btnWrieSting: TButton;
    btnReadSting: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    le_xlh: TEdit;
    le_akey: TEdit;
    le_sj: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnWrieStingClick(Sender: TObject);
    procedure btnReadStingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  port,baud:integer;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   i:integer;w1:word;b1:byte; buf1:array[0..200] of byte;s1:string;
begin
   port:=strtoint(trim(cb_port.Text ));
   baud:=strtoint(trim(cb_baud.Text ));
   //´ò¿ª´®¿Ú
   i:=rf_init_com(port,baud);
   if(i<>0)then
   begin
       lb_info.Caption:=' ³õÊ¼»¯´®¿ÚÊ§°Ü£¬·µ»ØÖµ£º'+inttostr(i);
       exit;
   end;
   //Ñ°¿¨
   i:=rf_request(0,$52,w1);
   if(i<>0)then
   begin
       lb_info.Caption:=' Ñ°¿¨Ê§°Ü£¬·µ»ØÖµ£º'+inttostr(i);
       exit;
   end;
   // ·À³å×² £¬buf1±£´æÐòÁÐºÅ
   i:=rf_anticoll(0,4,buf1[0],b1);
   if(i<>0)then
   begin
       lb_info.Caption:=' ·À³å×²Ê§°Ü£¬·µ»ØÖµ£º'+inttostr(i);
       exit;
   end;
   s1:='';
   for i:=0 to b1-1 do begin
       s1:=s1+inttohex(buf1[i],2);
   end;

   le_xlh.Text:=s1;
   lb_info.Caption:='·À³å×²³É¹¦';
   i:=rf_select(0,buf1[0],4,b1);
   if(i<>0)then
   begin
       lb_info.Caption:=' Ñ¡¿¨Ê§°Ü£¬·µ»ØÖµ£º'+inttostr(i);
       exit;
   end;
   lb_info.Caption:='Ñ°¿¨³É¹¦';
end;

procedure TForm1.Button4Click(Sender: TObject);
var
    i:integer;
begin
   i:=rf_halt(0);
   if(i<>0)then
   begin
       lb_info.Caption:=' ¿¨ÐÝÃßÊ§°Ü£¬·µ»ØÖµ£º'+inttostr(i);
       exit;
   end;
   lb_info.Caption:=' ¿¨ÐÝÃß³É¹¦£¡';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   i,j:integer;b1,b_kh:byte; buf1,buf2:array[0..200] of byte;s1:string;
begin
   b_kh:=cb_kh.ItemIndex;
   s1:=trim(le_akey.Text );
   if(length(s1)<>12)then
   begin
       lb_info.Caption:=' Length error£¡';
       le_akey.SetFocus;
       exit;
   end;
   for i:=0 to 5 do begin
       val('$'+midstr(s1,i*2+1,2),buf2[i],j);
   end;
   // key type
   if(rg_key.ItemIndex =0)  then
   begin
      b1:=$60;
   end
   else
   begin
      b1:=$61;
   end;
   //auth
   i:=rf_M1_authentication2(0,b1,b_kh,buf2[0]);
   if(i<>0)then
   begin
       lb_info.Caption:=' auth key failure,return code£º'+inttostr(i);
       exit;
   end;
   //read block
   i:=rf_M1_read(0,b_kh,buf1[0],b1);
   if(i<>0)then
   begin
       lb_info.Caption:=' read block failure£¬return code£º'+inttostr(i);
       exit;
   end;
   s1:='';
   for i:=0 to b1-1 do begin
       s1:=s1+inttohex(buf1[i],2);
   end;

   le_sj.Text:=s1;
   lb_info.Caption:=' read block successful£¡';
end;

procedure TForm1.Button3Click(Sender: TObject);
var
   i,j:integer;b1,b_kh:byte; buf1,buf2:array[0..200] of byte;s1:string;
begin
   b_kh:=cb_kh.ItemIndex;
   //keytyoe
   s1:=trim(le_akey.Text );
   if(length(s1)<>12)then
   begin
       lb_info.Caption:=' Length error£¡';
       le_akey.SetFocus;
       exit;
   end;
   for i:=0 to 5 do begin
       val('$'+midstr(s1,i*2+1,2),buf2[i],j);
   end;

   s1:=trim(le_sj.Text );
   if(length(s1)<>32)then
   begin
       lb_info.Caption:=' length error,needs 12 bytes£¡';
       le_sj.SetFocus;
       exit;
   end;
   for i:=0 to 15 do begin
       val('$'+midstr(s1,i*2+1,2),buf1[i],j);
   end;


   if(rg_key.ItemIndex =0)  then
   begin
      b1:=$60;
   end
   else
   begin
      b1:=$61;
   end;
   //auth key
   i:=rf_M1_authentication2(0,b1,b_kh,buf2[0]);
   if(i<>0)then
   begin
       lb_info.Caption:=' auth key failure,return code£º'+inttostr(i);
       exit;
   end;
   // write block
   i:=rf_M1_write(0,b_kh,buf1[0]);
   if(i<>0)then
   begin
       lb_info.Caption:=' write block failure£¬return code£º'+inttostr(i);
       exit;
   end;

   lb_info.Caption:=' write block successful£¡';

end;

procedure TForm1.btnWrieStingClick(Sender: TObject);
var
   i,j:integer;
   len,b1,b_kh:byte;
   buf1,buf2:array[0..100] of byte;
   s1,hexstr:string;
begin
   b_kh:=cb_kh.ItemIndex;
   //key type
   s1:=trim(le_akey.Text );
   if(length(s1)<>12)then
   begin
       lb_info.Caption:=' Length error£¡';
       le_akey.SetFocus;
       exit;
   end;
   for i:=0 to 5 do begin
       val('$'+midstr(s1,i*2+1,2),buf2[i],j);
   end;

   s1:=trim(edit1.Text );
   len:= length(s1);
   if(len>16)then
   begin
       lb_info.Caption:=' Length error,can not execeed 16 chars£¡';
       edit1.SetFocus;
       exit;
   end;

   hexstr:='';
   for i:=1 to len do
   begin
        hexstr:=hexstr+Inttohex(Ord(s1[i]),2);  // char=>hex
    end;

  // if len<16 then begin
  // len:=len div 2;
   for i:=1 to (16-len) do      // if not engough 16 bytes, then fill in 00
        begin
          hexstr:=hexstr+'00';
         end;
  // end;

   for i:=0 to 15 do begin
       val('$'+midstr(hexstr,i*2+1,2),buf1[i],j);
   end;


   if(rg_key.ItemIndex =0)  then
   begin
      b1:=$60;
   end
   else
   begin
      b1:=$61;
   end;
   //auth key
   i:=rf_M1_authentication2(0,b1,b_kh,buf2[0]);
   if(i<>0)then
   begin
       lb_info.Caption:=' auth key failure,return code£º'+inttostr(i);
       exit;
   end;
   // write block
   i:=rf_M1_write(0,b_kh,buf1[0]);
   if(i<>0)then
   begin
       lb_info.Caption:=' write block failure£¬return code£º'+inttostr(i);
       exit;
   end;
   
   lb_info.Caption:=' write block successful£¡';

end;

procedure TForm1.btnReadStingClick(Sender: TObject);
var
   i,j:integer;b1,b_kh:byte; buf1,buf2:array[0..200] of byte;s1:string;
begin
   b_kh:=cb_kh.ItemIndex;
   s1:=trim(le_akey.Text );
   if(length(s1)<>12)then
   begin
       lb_info.Caption:=' Length error£¡';
       le_akey.SetFocus;
       exit;
   end;
   for i:=0 to 5 do begin
       val('$'+midstr(s1,i*2+1,2),buf2[i],j);
   end;
   // key type
   if(rg_key.ItemIndex =0)  then
   begin
      b1:=$60;
   end
   else
   begin
      b1:=$61;
   end;
   //auth
   i:=rf_M1_authentication2(0,b1,b_kh,buf2[0]);
   if(i<>0)then
   begin
       lb_info.Caption:=' auth key failure,return code£º'+inttostr(i);
       exit;
   end;
   //read block
   i:=rf_M1_read(0,b_kh,buf1[0],b1);
   if(i<>0)then
   begin
       lb_info.Caption:=' read block failure£¬return code£º'+inttostr(i);
       exit;
   end;
   s1:='';
   for i:=0 to b1-1 do begin
     //  s1:=s1+inttohex(buf1[i],2);
       s1:=s1+Chr(buf1[i]); // hex=>char 
   end;

   edit2.Text:=s1;
   lb_info.Caption:=' read block successful£¡';

end;

end.
