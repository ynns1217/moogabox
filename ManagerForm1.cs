using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace moogabox
{
    public partial class ManagerForm1 : Form
    {
        public ManagerForm1()
        {
            InitializeComponent();

            var CurrentDirectory = Directory.GetCurrentDirectory();
            string newPath = Path.GetFullPath(Path.Combine(CurrentDirectory, @"..\..\Image\KakaoTalk_20220525_141938370.png"));
            pictureBox1.Load(newPath);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
        }

        private void Btn_Stock_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            ManagerForm3 M_frm3 = new ManagerForm3();
            M_frm3.ShowDialog();
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            Form0 frm0 = new Form0();
            frm0.ShowDialog();
            Application.Exit();
        }

        private void Btn_Sale_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            ManagerForm2 M_frm2 = new ManagerForm2();
            M_frm2.ShowDialog();
            Application.Exit();
        }

		private void ManagerForm1_FormClosing(object sender, FormClosingEventArgs e)
		{
			Application.Exit();
		}
	}
}
