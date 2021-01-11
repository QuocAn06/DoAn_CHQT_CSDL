USE CRM
GO

/***** PROC sp_ThemAdmin *****/
alter proc sp_ThemNHANVIEN
			@ten_NHANVIEN Nvarchar(50),
			@soDienThoai Nvarchar(20),
			@_email Nvarchar(50),
			@hinhanh Varchar(MAX),
			@_username Nvarchar(50),
			@_password Nvarchar(50)
as
begin
			begin try
			begin tran 
			set transaction isolation level serializable
			declare @ID Nvarchar(6)
				Set @ID = dbo.Auto_idNHANVIEN()
				waitfor delay '00:00:5'
				insert into NHANVIEN values (@ID,@ten_NHANVIEN, @soDienThoai, @_email, @hinhanh, @_username, @_password, 2)
				commit tran
			end try
			begin catch
			Rollback tran
			declare @BaoLoi nvarchar(3000) 
			select @BaoLoi='Xin bao loi: '+ ERROR_MESSAGE()
			raiserror (@BaoLoi,16,1)
			end catch
end

exec sp_ThemNHANVIEN N'An',N'0332101988',N'an.le@project.com','',N'nhanvien1',N'123456'
Select * From NHANVIEN





Select * FROM [dbo].[LOAINHANVIEN]
insert into [dbo].[LOAINHANVIEN](idLOAINHANVIEN,tenLOAINHANVIEN) Values(1,N'QUAN TRI VIEN')
insert into [dbo].[LOAINHANVIEN](idLOAINHANVIEN,tenLOAINHANVIEN) Values(2,N'NHAN VIEN')

Select * From [dbo].[QUAN]
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(1,N'Quận 1')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(2,N'Quận 2')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(3,N'Quận 3')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(4,N'Quận 4')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(5,N'Quận 5')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(6,N'Quận 6')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(7,N'Quận 7')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(8,N'Quận 8')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(9,N'Quận 9')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(10,N'Quận 10')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(11,N'Quận 11')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(12,N'Quận 12')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(13,N'Quận Bình Thạnh')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(14,N'Quận Thủ Đức')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(15,N'Quận Gò Vấp')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(16,N'Quận Phú Nhuận')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(17,N'Quận Tân Bình')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(18,N'Quận Tân Phú')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(19,N'Quận Bình Tân')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(20,N'Nhà Bè')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(21,N'Hóc Môn')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(22,N'Bình Chánh')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(23,N'Củ Chi')
insert into [dbo].[QUAN](idQUAN,tenQUAN) Values(24,N'Cần Giờ')

