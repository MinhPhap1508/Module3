use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject s
where s.Credit in (
select max(Credit)
from subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select sub.SubName, m.Mark
from mark m
join subject sub on m.SubId=sub.SubId
where m.Mark in(
select max(Mark)
from mark)
order by sub.SubName;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.StudentName, avg(m.mark) as normal
from student s
join mark m on s.StudentId=m.StudentId
group by s.StudentName
order by normal;