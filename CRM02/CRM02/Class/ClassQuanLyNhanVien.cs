﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CRM02
{
    class ClassQuanLyNhanVien
    {
        private static ClassQuanLyNhanVien instance;

        public ClassQuanLyNhanVien()
        {
        }

        public static ClassQuanLyNhanVien Intance {
            get{ if (instance== null) instance = new ClassQuanLyNhanVien(); return instance;}
            set => instance = value;
        }

        public List<ClassNhanVien> LoadDanhSachNhanVien()
        {
            List<ClassNhanVien>  list = new List<ClassNhanVien>();

            string query = "select _username,ten_NHANVIEN from [dbo].[NHANVIEN] where idLOAINHANVIEN = 2";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                list.Add(new ClassNhanVien(item));
            }

            return list;
        }

        public ClassNhanVien LoadUserById(string id)
        {
            ClassNhanVien result = new ClassNhanVien();
       
            string query = "select _username,ten_NHANVIEN,hinhanh,idLOAINHANVIEN from [dbo].[NHANVIEN] where _username = '" + id +"'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            result =   new ClassNhanVien(data.Rows[0]);
            
            return result;
        }

        public bool DangNhap(string tendangnhap, string matkhau)
        {

            byte[] temp = ASCIIEncoding.ASCII.GetBytes(matkhau);
            byte[] hashData = new MD5CryptoServiceProvider().ComputeHash(temp);
            matkhau = BitConverter.ToString(hashData);

            string query = "select * from [dbo].[NHANVIEN] where _username='" + tendangnhap + "' and _password='" + matkhau + "'";         
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result.Rows.Count > 0;
        }


    }
}
