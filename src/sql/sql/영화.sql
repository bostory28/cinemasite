--��ȭ
insert 
  into movie 
values 
      (
      SEQ_movie_movie_seq.nextval, 
      '��ú�',
      '���', 
      '������', 
      '������', 
      '���ѹα�', 
      123, 
      15, 
      sysdate, 
      sysdate, 
      '������',
      '��ƿ��', 
      '����巹��', 
      '���丮', 
      sysdate); 
      
--�ð�
insert 
  into timetable
values 
      (
      SEQ_timetable_timetable_seq.nextval, 
      1,
      sysdate,
      '10:00',
      1
      ); 
      
      
insert into movie(
	movie_seq,	-- ��ȭ����
	title ,	-- ��ȭ�帣
	genre ,	-- ��ȭ����
	director ,	-- ��ȭ����
	actors,	-- ��ȭ���۳���
	nation ,	-- �󿵽ð�
	runningtime ,	-- ��ȭ���
	rate,	-- ��ȭ������
	openingday ,	-- ��ȭ������
	closingday ,	-- ��ȭ������
	poster ,	-- ��ȭ�ٰŸ�
	story ,	-- ���۳�¥
	madeday
) values (
	SEQ_movie_movie_seq.nextval,
	'�������',
	'�ִϸ��̼�',
	'�� Ȧ',
	'�ٳ׿� ���, ���ƾ� ����, �������',
	'�̱�',
	108,
	0,
	to_date('150121','YY/MM/DD'),
	to_date('150321','YY/MM/DD'),
	'bighero2015_poster.jpg',
	'ġ������ ����! �� �Ⱦ��ְ� ���� �����κ� �����̸ƽ������� ��������� ��������ΰ� �´�!õ�� ���е� ���׵𡯰� ������ �����κ� �����̸ƽ���!  ���׵��� �������� �κ� �������� �����Ρ��� ���ð� �ı��� ���⿡ ó���� �����̸ƽ����� ��������η� ���׷��̵� �ϴµ��� ���� �̵��� ������ ������ ���Ƴ� �� ������?',
	to_date('140101','YY/MM/DD')
);
      