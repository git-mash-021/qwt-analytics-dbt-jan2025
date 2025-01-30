{{config(materialized = 'table', schema = 'transforming')}}
 
with recursive managers (indent, employeeid, managerid, employeetitle)
as
(
    select ' ' as indent, empid as employeeid, reports_to as managerid, title as employeetitle
    from
    {{ref('stg_employees')}}
    where title = 'President'
 
    union all
 
    select indent || '* ', employee.empid as employeeid, employee.reports_to as managerid, employee.title
    as employeetitle
 
    from
 
    {{ref("stg_employees")}} as employee join managers
    on employee.reports_to = managers.employeeid
)
 
select indent || employeetitle as title, employeeid, managerid
from managers