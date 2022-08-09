# Generated by Django 3.2.5 on 2022-05-16 03:03

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Countries',
            fields=[
                ('country_id', models.CharField(max_length=2, primary_key=True, serialize=False)),
                ('country_name', models.CharField(max_length=40, null=True)),
            ],
            options={
                'db_table': 'countries',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Departments',
            fields=[
                ('department_id', models.AutoField(primary_key=True, serialize=False)),
                ('department_name', models.CharField(max_length=30, null=True)),
            ],
            options={
                'db_table': 'departments',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Employees',
            fields=[
                ('employee_id', models.AutoField(primary_key=True, serialize=False)),
                ('first_name', models.CharField(max_length=20, null=True)),
                ('last_name', models.CharField(max_length=25, null=True)),
                ('email', models.CharField(max_length=25, null=True)),
                ('phone_number', models.CharField(max_length=20, null=True)),
                ('hire_date', models.DateField(null=True)),
                ('salary', models.IntegerField(null=True)),
                ('commission_pct', models.IntegerField(null=True)),
            ],
            options={
                'db_table': 'departments',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='JobHistory',
            fields=[
                ('job_history_id', models.AutoField(primary_key=True, serialize=False)),
                ('department_name', models.CharField(max_length=30, null=True)),
            ],
            options={
                'db_table': 'departments',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Jobs',
            fields=[
                ('job_id', models.CharField(max_length=10, primary_key=True, serialize=False)),
                ('job_title', models.CharField(max_length=35, null=True)),
                ('min_salary', models.IntegerField(null=True)),
                ('max_salary', models.IntegerField(null=True)),
            ],
            options={
                'db_table': 'jobs',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Locations',
            fields=[
                ('location_id', models.AutoField(primary_key=True, serialize=False)),
                ('street_address', models.CharField(max_length=40, null=True)),
                ('postal_code', models.CharField(max_length=12, null=True)),
                ('city', models.CharField(max_length=30, null=True)),
                ('state_province', models.CharField(max_length=25, null=True)),
            ],
            options={
                'db_table': 'locations',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Regions',
            fields=[
                ('region_id', models.AutoField(primary_key=True, serialize=False)),
                ('region_name', models.CharField(max_length=25, null=True)),
            ],
            options={
                'db_table': 'regions',
                'managed': False,
            },
        ),
    ]
