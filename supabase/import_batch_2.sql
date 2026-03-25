insert into public.posts (slug, title, content, tags, excerpt)
values (
  'welcome',
  convert_from(decode('5qyi6L+O5p2l5Yiw5oiR55qE56yU6K6w5Y2a5a6i', 'base64'), 'UTF8'),
  convert_from(decode('DQrov5nkuKrnq5nngrnlt7Lnu4/lrozmiJDkuobmnIDlsI/pqqjmnrbvvJoNCg0KLSDpppbpobXmlofnq6DliJfooagNCi0g5paH56ug6K+m5oOF6aG1DQotIENvbnRlbnQgQ29sbGVjdGlvbnMg5YaF5a655qCh6aqMDQoNCuS4i+S4gOatpeS9oOWPr+S7peaKiuW3suacieeslOiusOaLhuWIhuaIkOWkmuevhyBNYXJrZG93biDmlL7liLDmnKznm67lvZXjgIINCg==', 'base64'), 'UTF8'),
  '{"开始","Astro"}'::text[],
  convert_from(decode('6L+Z5piv56uZ54K56aqo5p6255qE56ys5LiA56+H5paH56ug77yM55So5LqO6aqM6K+B5YaF5a65566h57q/5piv5ZCm5q2j5bi444CC', 'base64'), 'UTF8')
)
on conflict (slug) do update set
  title = excluded.title,
  content = excluded.content,
  tags = excluded.tags,
  excerpt = excluded.excerpt,
  updated_at = now();