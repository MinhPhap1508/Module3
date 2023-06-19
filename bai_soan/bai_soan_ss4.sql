use ss2;
-- 1.Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp 
select c.name, count(*) quantity
from class c
join student s on s.class_id=c.id
group by c.name;
-- 2. Tính điểm lớn nhất của mỗi các lớp
select c.name,max(point) max_point
from class c
join student s on s.class_id=c.id
group by c.name;
-- 3.Tình điểm trung bình  của từng lớp
select c.name,avg(point) medium_score
from class c
join student s on s.class_id=c.id
group by c.name;
-- 4.Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym
select i.name,i.birthday,'instructor' as type
from instructor i
union all
select s.name , s.birthday,'student' as type
from student s;
-- 5.Lấy ra top 3 học viên có điểm cao nhất của trung tâm
select name, point
from student
order by point desc;
select name,point
from student
where point=(
select max(point)
from student)
order by name asc;