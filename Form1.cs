using System;
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
	
    public partial class Form1 : Form
    {

		public string ID { get; set; }

		public Form1()
        {
            InitializeComponent();
        }

        private void btnInquiry_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            Form2 frm2 = new Form2();
            frm2.ShowDialog();
            Application.Exit();
        }

        private void btnticket_Click(object sender, EventArgs e)
        {
            Form4 frm4 = new Form4();
            this.Visible = false;
            frm4.ID = ID;
            frm4.ShowDialog();
            Application.Exit();
        }

        private void btnStore_Click(object sender, EventArgs e)
        {
            Form9 frm9 = new Form9();
            this.Visible = false;
            frm9.ShowDialog();
            Application.Exit();
        }

		private void Form1_Load(object sender, EventArgs e)
		{

		}

		private void panel1_Paint(object sender, PaintEventArgs e)
		{

		}

		private void Form1_FormClosing(object sender, FormClosingEventArgs e)
		{
			Application.Exit();
		}

		private void panel1_Paint_1(object sender, PaintEventArgs e)
		{

		}
	}
}
