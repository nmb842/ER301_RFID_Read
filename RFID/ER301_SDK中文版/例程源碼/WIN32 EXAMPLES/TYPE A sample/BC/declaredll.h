//extern "C" int WINAPI rf_init_com(int port,long baud);
typedef int (WINAPI *F_RF_INIT_COM)(int,long);
//extern "C" int WINAPI rf_request(unsigned short icdev, unsigned char model, unsigned short *TagType);
typedef int (WINAPI *F_RF_REQUEST)(unsigned short,unsigned char,unsigned short *);
//extern "C" int WINAPI rf_anticoll(unsigned short icdev, unsigned char bcnt, unsigned char *pSnr,unsigned char* pRLength);
typedef int (WINAPI *F_RF_ANTICOLL)(unsigned short,unsigned char, unsigned char *,unsigned char*);
//extern "C" int WINAPI rf_select(unsigned short icdev,unsigned char *pSnr,unsigned char srcLen,unsigned char *Size);
typedef int (WINAPI *F_RF_SELECT)(unsigned short,unsigned char *,unsigned char,unsigned char *);
//extern "C" int WINAPI rf_halt(unsigned short icdev);
typedef int (WINAPI *F_RF_HALT)(unsigned short);
//extern "C" int WINAPI rf_M1_read(unsigned short icdev, unsigned char block, unsigned char *pData,unsigned char *pLen);
typedef int (WINAPI *F_RF_M1_READ)(unsigned short,unsigned char, unsigned char *,unsigned char *);
//extern "C" int WINAPI rf_M1_write(unsigned short icdev, unsigned char block, unsigned char *data);
typedef int (WINAPI *F_RF_M1_WRITE)(unsigned short,unsigned char, unsigned char * );
//extern "C" int WINAPI rf_M1_authentication2(unsigned short icdev,unsigned char model,unsigned char block,unsigned char *key);
typedef int (WINAPI *F_RF_M1_AUTHENTICATION2)(unsigned short,unsigned char,unsigned char,unsigned char *);
