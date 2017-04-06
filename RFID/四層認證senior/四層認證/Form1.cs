using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                serialPort1.PortName = comboBox1.Text;
                serialPort1.BaudRate = 115200;
                serialPort1.Open();
                //timer1.Enabled = true;
                button5.Text = "連線中";
            }
            catch
            {
                MessageBox.Show("ERROR");
            }
          }
        private void button1_Click(object sender, EventArgs e)
        {
            byte[] a = { 170, 187, 06, 00, 00, 00, 01, 02, 82, 81 };
            serialPort1.Write(a, 0, a.Length);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Byte[] card = new Byte[] { 170, 187, 05, 00, 00, 00, 02, 02, 00 };//寫入第2層指令
            serialPort1.Write(card, 0, card.Length);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Byte[] slecet = new Byte[] { 170, 187, 09, 00, 00, 00, 03, 02, 190, 151, 123, 163, 240 };//寫入第3層指令
            serialPort1.Write(slecet, 0, slecet.Length);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Byte[] authentication = new Byte[] { 170, 187, 13, 00, 00, 00, 07, 02, 96, 04, 255, 255, 255, 255, 255, 255, 97 };//寫入第四層指令
            serialPort1.Write(authentication, 0, authentication.Length);
            timer1.Interval = 500;
            timer1.Enabled = true;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (serialPort1.BytesToRead > 0)
            {
                int i = serialPort1.BytesToRead;
             
           //     textBox1.Text += "serialPort1.BytesToRead=" + i +"\r\n";
                Byte[] a1 = new Byte[i];
                string s = "";
                serialPort1.Read(a1, 0, i);
                for (int j = 0; j < i; j++)
                {
                    s = a1[j].ToString() + ". ";
                    textBox1.Text += s;
                
                }
               // textBox1.Text = textBox1.Text + "\r\n";
                timer1.Enabled = false;
            }
        }
    }
}
