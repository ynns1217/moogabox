using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using moogabox;
using System.Configuration;

namespace moogabox
{
	// 예매임시테이블 과 매점구매 테이블을 불러와 각각의 그룹에 뿌린다.
	public partial class Form7 : Form
	{
		private string Constr = "Server=(local);database=moogabox;" +
			   "Integrated Security=true";

		public Form7()
		{
			InitializeComponent();
		}

		private void Form7_Load(object sender, EventArgs e)
		{
			this.txtSumTotal.Text = (DataLoadMajum() + DataLoadMovie()).ToString();
		}

		private int DataLoadMovie()
		{
			var Conn = new SqlConnection(Constr);
			Conn.Open();

			var Comm = new SqlCommand("Select MvName, StartTime, Hall, SeatNum from TmpReservation", Conn);
			SqlDataReader R;
			R = Comm.ExecuteReader();

			int Count = 1; 
			int sum = 0;
			if (R.Read())    // R에 아직 읽을 행이 남아있는동안 무한반복(한행 읽고 다음행을 읽는다
			{
				string MvName = R["MvName"].ToString();       
				string StartTime = R["StartTime"].ToString(); 
				string Hall = R["Hall"].ToString();  
				
				string SeatNum = "";

				string[] SeatNumArray = new string[4];
				int length = R["SeatNum"].ToString().Length/4;

				int j = 0;
				for (int i = 0; i < length; i++)
				{
					SeatNumArray[i] = R["SeatNum"].ToString().Substring(j, 3);
					j += 4;
					SeatNum += SeatNumArray[i];
					if (i >= length - 1) break;
					SeatNum += ", ";
					Count++;
				}

				sum = 14000 * Count;

				string Ccount = Count.ToString();     
				string Mmoney = sum.ToString();

				

				// 이렇게 저장된 string 문자열들을 문자열배열을 선언해 삽입
				string[] strs = new string[] { MvName, StartTime, Hall, SeatNum, Ccount, Mmoney };

				// ListView에 Item으로 삽입되려면 열수에 맞는 배열요소를 가진 문자열 배열이어야 하므로
				ListViewItem getItem = new ListViewItem(strs);
				lvMovie.Items.Add(getItem);
			}
			R.Close();

			string UpdateCount_Money = string.Format("update TmpReservation set Ccount = {0}, Mmoney = {1}", Count, sum);
			Comm = new SqlCommand(UpdateCount_Money, Conn);
			Comm.ExecuteNonQuery();

			this.txtSumMovie.Text = sum.ToString();
			Conn.Close();
			return sum;
		}

		private int DataLoadMajum()
		{
			var Conn = new SqlConnection(Constr);
			Conn.Open();

			var Comm = new SqlCommand("Select SnackName, SnackNum, BuyPrice, BuyCount,SnackPrice from TmpBuySnack", Conn);
			SqlDataReader R;
			R = Comm.ExecuteReader();

			int sum = 0;
			while (R.Read())    // R에 아직 읽을 행이 남아있는동안 무한반복(한행 읽고 다음행을 읽는다
			{
				
				string SnackName = R["SnackName"].ToString();   
				string SnackNum = R["SnackNum"].ToString();     
				string BuyPrice = R["BuyPrice"].ToString();     
				string BuyCount = R["BuyCount"].ToString();     
				string SnackPrice = R["SnackPrice"].ToString();

				sum += Convert.ToInt32(BuyPrice);

				// 이렇게 저장된 string 문자열들을 문자열배열을 선언해 삽입
				string[] strs = new string[] { SnackName, SnackNum, SnackPrice, BuyCount, BuyPrice};

				// ListView에 Item으로 삽입되려면 열수에 맞는 배열요소를 가진 문자열 배열이어야 하므로
				ListViewItem getItem = new ListViewItem(strs);
				lvMajum.Items.Add(getItem);
			}
			this.txtSumMajum.Text = sum.ToString();

			R.Close();
			Conn.Close();
			return sum;
			
		}

		private void btnCheck_Click(object sender, EventArgs e)
		{
			var Conn = new SqlConnection(Constr);
			Conn.Open();
			string InsertSql = string.Format("insert into BuySnack (ID, SnackName, SnackNum, BuyPrice, BuyCount) select ID, SnackName, SnackNum, BuyPrice, BuyCount from TmpBuySnack;");
			var Com = new SqlCommand(InsertSql, Conn);
			Com.ExecuteNonQuery();

			SqlDataReader R;

			string SelectSql = "Select SnackNum, BuyCount from TmpBuySnack";
			var Comm = new SqlCommand(SelectSql, Conn);
			R = Comm.ExecuteReader();

			List<string> SnackNumList = new List<string>();
			List<int> BuyCountList = new List<int>();
			int ItemCount = 0;

			while (R.Read())
			{
				
				SnackNumList.Add(R["SnackNum"].ToString());
				BuyCountList.Add(Convert.ToInt32(R["BuyCount"]));
				ItemCount++;
			}
			R.Close();
			
			for(int i = 0; i < ItemCount; i++)
			{
				string UpdateSql = "Update Maejum set SnackCount = SnackCount - " + BuyCountList[i] + " where SnackNum = '" + SnackNumList[i] + "'";
				Comm = new SqlCommand(UpdateSql, Conn);
				Comm.ExecuteNonQuery();
			}


			Com = new SqlCommand("delete from TmpBuySnack", Conn);
			Com.ExecuteNonQuery();

			if(!(this.txtSumMovie.Text == "0"))
			{
				Form8 form8 = new Form8();
				form8.Show();
				this.Hide();
			}
			else
			{
				Form1 form1 = new Form1();
				form1.Show();
				this.Hide();
			}
			
		}

		private void btnBack_Click(object sender, EventArgs e)
		{
			var Conn = new SqlConnection(Constr);
			Conn.Open();

			var Comm = new SqlCommand("delete from TmpReservation", Conn);
			Comm.ExecuteNonQuery();

			Conn.Close();

			Form1 form1 = new Form1();
			form1.Show();
			this.Hide();
		}

		private void Form7_FormClosing(object sender, FormClosingEventArgs e)
		{
			Application.Exit();
		}

		private void panel2_Paint(object sender, PaintEventArgs e)
		{

		}

        private void label6_Click(object sender, EventArgs e)
        {

        }
    }
}
