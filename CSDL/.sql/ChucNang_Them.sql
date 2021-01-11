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


insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 1',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 2',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 3',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 4',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 5',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 6',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 7',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 8',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 9',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 10',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 11',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận 12',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận Bình Thạnh',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận Thủ Đức',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận Gò Vấp',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận Phú Nhuận',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận Tân Bình',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận Tân Phú',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Quận Bình Tân',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Nhà Bè',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Hóc Môn',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Bình Chánh',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Củ Chi',1)
insert into [dbo].[QUAN](tenQUAN,idTHANHPHO) Values(N'Cần Giờ',1)

