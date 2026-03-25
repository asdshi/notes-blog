-- local import batch 4
insert into public.posts (slug,title,content,tags,excerpt)
values (
  'local/java/张子硕-简历',
  convert_from(decode('5byg5a2Q56GVLeeugOWOhg==','base64'),'UTF8'),
  convert_from(decode('','base64'),'UTF8'),
  '{"java","本地导入"}'::text[],
  convert_from(decode('','base64'),'UTF8')
)
on conflict (slug) do update set
  title=excluded.title,
  content=excluded.content,
  tags=excluded.tags,
  excerpt=excluded.excerpt,
  updated_at=now();

insert into public.posts (slug,title,content,tags,excerpt)
values (
  'local/java/ja',
  convert_from(decode('amE=','base64'),'UTF8'),
  convert_from(decode('MS4gKirpnZ7pnZnmgIHlhoXpg6jnsbvvvJogKiogDQrpnZ7pnZnmgIHlhoXpg6jnsbvkvp3otZbkuo7lpJbpg6jnsbvnmoTlrp7kvovjgILopoHliJvlu7rpnZ7pnZnmgIHlhoXpg6jnsbvnmoTlrp7kvovvvIzlv4XpobvpppblhYjliJvlu7rlpJbpg6jnsbvnmoTlrp7kvovjgIINCui/meaYr+WboOS4uumdnumdmeaAgeWGhemDqOexu+WPr+S7peiuv+mXruWklumDqOexu+eahOWunuS+i+aIkOWRmOOAgg0KDQogIA0K6Z2Z5oCB5YaF6YOo57G75LiN5L6d6LWW5LqO5aSW6YOo57G755qE5a6e5L6L44CC5Y+v5Lul55u05o6l5Yib5bu66Z2Z5oCB5YaF6YOo57G755qE5a6e5L6L77yM6ICM5LiN6ZyA6KaB5Yib5bu65aSW6YOo57G755qE5a6e5L6L44CCDQrpnZnmgIHlhoXpg6jnsbvkuI3og73nm7TmjqXorr/pl67lpJbpg6jnsbvnmoTlrp7kvovmiJDlkZjvvIzkvYblj6/ku6Xorr/pl67lpJbpg6jnsbvnmoTpnZnmgIHmiJDlkZjjgIINCjIuIOaKveixoeexu+S4jeiDveiiq+WunuS+i+WMlu+8jOaKveixoeaWueazleS4jeiDveacieWHveaVsOS9k++8jOaKveixoeexu+S4reWPr+S7peaciemdnuaKveixoeaWueazleOAgg0KMy4g5o6l5Y+j5LiN6IO96KKr5a6e5L6L5YyWDQo0LiDlnKjnu6fmib/mjqXlj6Pml7blv4Xpobvph43lhpnmjqXlj6PkuK3nmoTmiYDmnInmlrnms5UNCjUuIA==','base64'),'UTF8'),
  '{"java","本地导入"}'::text[],
  convert_from(decode('MS4gKirpnZ7pnZnmgIHlhoXpg6jnsbvvvJogKiog6Z2e6Z2Z5oCB5YaF6YOo57G75L6d6LWW5LqO5aSW6YOo57G755qE5a6e5L6L44CC6KaB5Yib5bu66Z2e6Z2Z5oCB5YaF6YOo57G755qE5a6e5L6L77yM5b+F6aG76aaW5YWI5Yib5bu65aSW6YOo57G755qE5a6e5L6L44CCIOi/meaYr+WboOS4uumdnumdmeaAgeWGhemDqOexu+WPr+S7peiuv+mXruWklumDqOexu+eahOWunuS+i+aIkOWRmOOAgiDpnZnmgIHlhoXpg6jnsbvkuI3kvp3otZbkuo7lpJbpg6jnsbvnmoTlrp7kvovjgILlj6/ku6Xnm7TmjqXliJvlu7rpnZnmgIHlhoXpg6jnsbvnmoTlrp7kvovvvIzogIzkuI3pnIDopoHliJvlu7rlpJbpg6jnsbvnmoTlrp7kvovjgIIg6Z2Z5oCB5YaF6YOo57G75LiN6IO955u05o6l6K6/6Zeu5aSW','base64'),'UTF8')
)
on conflict (slug) do update set
  title=excluded.title,
  content=excluded.content,
  tags=excluded.tags,
  excerpt=excluded.excerpt,
  updated_at=now();

insert into public.posts (slug,title,content,tags,excerpt)
values (
  'local/java/prompt',
  convert_from(decode('8J+kliBBSeiHquWKqOaKlemAkuaMh+S7pCAtIEJvc3Pnm7TogZhKYXZh5ZCO56uv5a6e5Lmg55Sf','base64'),'UTF8'),
  convert_from(decode('IyDwn6SWIEFJ6Ieq5Yqo5oqV6YCS5oyH5LukIC0gQm9zc+ebtOiBmEphdmHlkI7nq6/lrp7kuaDnlJ8NCg0KIyMg8J+OryDmiafooYznm67moIcNCioq5q+P5qyh5oqV6YCSNTDkuKrnrKblkIjmnaHku7bnmoRKYXZh5ZCO56uv5a6e5Lmg55Sf6IGM5L2NKioNCg0KDQojIyMg4pyFIOeri+WNs+eUs+ivt+adoeS7tu+8iOWFqOmDqOa7oei2s+aJjeeUs+ivt++8iQ0KYGBgDQrogYzkvY3moIfpopjljIXlkKs6IEphdmEgKyAo5ZCO56uvfOW8gOWPkXzlrp7kuaApDQrmioDmnK/moIjmmI7noa46IEphdmEvU3ByaW5nQm9vdC9NeUJhdGlzL015U1FMDQrlhazlj7jop4TmqKE6IOKJpTEwMOS6ug0K5Zyw54K5OiDljJfkuqzvvIjpnZ7kuIrmtbfvvIkNCkJPU1PmtLvot4M6IOKJpDPlpKnlhoUNCmBgYA0KIyMjIOKdjCDnq4vljbPot7Pov4fmnaHku7bvvIjku7vkuIDmu6HotrPlsLHot7Pov4fvvIkNCmBgYA0K6IGM5L2N5Li65q2j5byP5bel56uL5Y2z6Lez6L+HDQrkuIDnur/lpKfljoI6IOWtl+iKgui3s+WKqHzpmL/ph4zlt7Tlt7R86IW+6K6vfOeZvuW6pnznvo7lm6J85LuK5pel5aS05p2hDQrmioDmnK/moIjplJnor686IOe6r1B5dGhvbnznuq9Hb3zliY3nq698UEhQfC5ORVR8QysrDQrlhazlj7jlpKrlsI86IDwxMDDkuroNCuWcsOeCuemUmeivrzog5LiK5rW3fOWFtuS7luWfjuW4gg0KQk9TU+S4jea0u+i3gzogPjPlpKnmnKrmtLvot4MNCmBgYA0KDQojIyDwn6eR4oCN77+9IOaxguiBjOiAheS/oeaBr++8iOS+m+WPguiAg++8iQ0KLSAqKuW8oOWtkOehlSoqIHwgMjHlsoEgfCDmsrPljZfnkIblt6XlpKflraborqHnrpfmnLrkuJPkuJrlpKfkuowNCi0gKirmoLjlv4PmioDog70qKjogSmF2YSArIFNwcmluZ0Jvb3QgKyBNeUJhdGlzICsgTXlTUUwgKyBSZWRpcw0KLSAqKumhueebrue7j+mqjCoqOiDmmbrog73ohrPpo5/liqnmiYso57yT5a2Y5LyY5YyWKeOAgeWFseWLieS6keivvuWggijlvq7mnI3liqEpDQotICoq5a6e5Lmg5pe26ZW/Kio6IDbkuKrmnIgr77yM5q+P5ZGoNC015aSpDQoNCg==','base64'),'UTF8'),
  '{"java","本地导入"}'::text[],
  convert_from(decode('IyDwn6SWIEFJ6Ieq5Yqo5oqV6YCS5oyH5LukIC0gQm9zc+ebtOiBmEphdmHlkI7nq6/lrp7kuaDnlJ8gIyMg8J+OryDmiafooYznm67moIcgKirmr4/mrKHmipXpgJI1MOS4quespuWQiOadoeS7tueahEphdmHlkI7nq6/lrp7kuaDnlJ/ogYzkvY0qKiAjIyMg4pyFIOeri+WNs+eUs+ivt+adoeS7tu+8iOWFqOmDqOa7oei2s+aJjeeUs+ivt++8iSBgYGAg6IGM5L2N5qCH6aKY5YyF5ZCrOiBKYXZhICsgKOWQjuerr3zlvIDlj5F85a6e5LmgKSDmioDmnK/moIjmmI7noa46IEphdmEvU3ByaW4=','base64'),'UTF8')
)
on conflict (slug) do update set
  title=excluded.title,
  content=excluded.content,
  tags=excluded.tags,
  excerpt=excluded.excerpt,
  updated_at=now();

insert into public.posts (slug,title,content,tags,excerpt)
values (
  'local/javaweb/vue',
  convert_from(decode('LlZ1ZSDmlofku7bku4vnu40=','base64'),'UTF8'),
  convert_from(decode('IyAuVnVlIOaWh+S7tuS7i+e7jQ0KDQoxLiDmr4/kuIDkuKoudnVl5paH5Lu25a6e6ZmF5LiK55qE5L2c55So5bCx5piv5Yi25L2c5qih54mI77yM54S25ZCO5bCG5qih54mI5oyC6L295Yiw6aG16Z2i5LiKLOS4jeWQjOeahHZ1ZeaWh+S7tumAmui/h2ltcG9ydOWKoOi9veWIsOWQjOS4gOS4qnZ1ZeaWh+S7tuS4rSzmnIDlkI7pgJrov4dtYWluLmpz55qE5byV5YWl5bCGdnVl5paH5Lu25oyC6L295Yiw6aG16Z2i5LiKLg0KMi4gQE1hcHBlcuazqOino+eahOS9nOeUqOaYr+WwhuS4gOS4quexu+eahOWunuS+i+aWueazleaYoOWwhOWIsOS4gOS4quaOpeWPo+S4iu+8jOi/meagt+aIkeS7rOWwseWPr+S7pemAmui/h+aOpeWPo+adpeiwg+eUqOWunuS+i+aWueazle+8jOWcqOS9v+eUqOivpeaOpeWPo+aYr+S7jemcgOimgUBBdXRv6Ieq5Yqo5rOo5YWlDQozLiAxLuWIm+W7umFvcOexuyw=','base64'),'UTF8'),
  '{"javaweb","本地导入"}'::text[],
  convert_from(decode('IyAuVnVlIOaWh+S7tuS7i+e7jSAxLiDmr4/kuIDkuKoudnVl5paH5Lu25a6e6ZmF5LiK55qE5L2c55So5bCx5piv5Yi25L2c5qih54mI77yM54S25ZCO5bCG5qih54mI5oyC6L295Yiw6aG16Z2i5LiKLOS4jeWQjOeahHZ1ZeaWh+S7tumAmui/h2ltcG9ydOWKoOi9veWIsOWQjOS4gOS4qnZ1ZeaWh+S7tuS4rSzmnIDlkI7pgJrov4dtYWluLmpz55qE5byV5YWl5bCGdnVl5paH5Lu25oyC6L295Yiw6aG16Z2i5LiKLiAyLiBATWFwcGVy5rOo6Kej55qE5L2c55So5piv5bCG5LiA5Liq57G755qE5a6e5L6L5pa55rOV5pig5bCE5Yiw5LiA5Liq5o6l5Y+j5LiK77yM','base64'),'UTF8')
)
on conflict (slug) do update set
  title=excluded.title,
  content=excluded.content,
  tags=excluded.tags,
  excerpt=excluded.excerpt,
  updated_at=now();
