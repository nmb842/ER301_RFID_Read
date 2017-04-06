using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        byte[] Req = { 170, 187, 06, 00, 00, 00, 01, 02, 82, 81 }; //Mifare Request
        byte[] ReqBuffer = new byte[12];//store Card type
        byte[] Antcollision = { 170,187,05,00,00,00,02,02,00}; //Mifare Antcollision
        byte[] AntcollisionBuffer = new byte[14];//store 
        byte[] DivceBeep = { 170, 187, 06, 00, 00, 00, 06, 01, 100, 99 };//beep
        byte[] LedColor_RedOn = { 170, 187, 06, 00, 00, 00,07,01,03,05 };      
        byte[] CardNumber = new byte[4];     



        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                serialPort1.PortName = ComPort.Text;
                serialPort1.BaudRate = Int32.Parse(Rate.Text);
                serialPort1.Open();
                timer1.Enabled = true;
                timer1.Interval = 100;
                Satus.Text = "connect";
                Satus.ForeColor = Color.Red;
                button1.Enabled = false;
                
            }
            catch {
                MessageBox.Show("error");
            }    


        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            serialPort1.Write(Req, 0, Req.Length);
            Thread.Sleep(200);
            if (serialPort1.BytesToRead > 0) {
                
                textBox1.Text = "";
                serialPort1.Read(ReqBuffer, 0, ReqBuffer.Length);
                foreach (byte dd in ReqBuffer) {
                    textBox1.Text += dd+",";
                }

                
            }

            if (ReqBuffer[8] == 0) {
                
                textBox2.Text += "    ";
                serialPort1.Write(Antcollision, 0, Antcollision.Length);
                Thread.Sleep(300);
                if (serialPort1.BytesToRead > 0) {
                    serialPort1.Read(AntcollisionBuffer, 0, AntcollisionBuffer.Length);
                    if (AntcollisionBuffer[8] == 0) {
                        if (AntcollisionBuffer[9] == CardNumber[0] &&
                           AntcollisionBuffer[10] == CardNumber[1] &&
                           AntcollisionBuffer[11] == CardNumber[2] &&
                           AntcollisionBuffer[12] == CardNumber[3]
                            )
                        {
                            return;
                        }
                        else {
                            serialPort1.Write(DivceBeep, 0, DivceBeep.Length);
                            Thread.Sleep(500);

                            serialPort1.Write(LedColor_RedOn, 0, LedColor_RedOn.Length);
                            Thread.Sleep(600);
                            
                            CardNumber[0] = AntcollisionBuffer[9];
                            CardNumber[1] = AntcollisionBuffer[10];
                            CardNumber[2] = AntcollisionBuffer[11];
                            CardNumber[3] = AntcollisionBuffer[12];

                            for (int i = 0; i <= 3; i++) {
                                textBox2.Text += CardNumber[i]+" ";
                            }                                             
                        }
                    }
                }
            }
        }
    }
}
