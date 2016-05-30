# These are the answers of the BookingBug assessment

## For questions 1 to 3
Please download the booking_bug.rb file and run following command. Or see previews below.
```ruby
ruby booking_bug.rb
```

### Previews

#### Q1
```ruby
Answer 1
[4, "x"]
```

#### Q2
```ruby
Answer 2
[4, 7, 8, "x"]
[4, 7, "x", 8]
[4, 8, 7, "x"]
[4, 8, "x", 7]
[4, "x", 7, 8]
[4, "x", 8, 7]
[7, 4, 8, "x"]
[7, 4, "x", 8]
[7, 8, 4, "x"]
[7, 8, "x", 4]
[7, "x", 4, 8]
[7, "x", 8, 4]
[8, 4, 7, "x"]
[8, 4, "x", 7]
[8, 7, 4, "x"]
[8, 7, "x", 4]
[8, "x", 4, 7]
[8, "x", 7, 4]
["x", 4, 7, 8]
["x", 4, 8, 7]
["x", 7, 4, 8]
["x", 7, 8, 4]
["x", 8, 4, 7]
["x", 8, 7, 4]
```

#### Q3
Please note that all elements of this array are randomly filled so you will see different result when you run the code.
```ruby
Answer 3
["No", "No", "Maybe", "Maybe", "No"]
["Yes", "Maybe", "Yes", "Yes", "Yes"]
["Yes", "Yes", "Yes", "No", "No"]
["Yes", "Maybe", "No", "Maybe", "Maybe"]
["Maybe", "Maybe", "Yes", "No", "Yes"]
```

## Questions 4
This is written in a gem. Please find [here](https://github.com/iambanklee/bookingbug-api) for more details

## Questions 5
MySQL:
```SQL
SELECT t.name as team_name, SUM(p.goals) as team_goals FROM teams t
LEFT JOIN players p on p.team_id = t.id
GROUP BY t.name
ORDER BY t.id
;
```

Result preview:

|team_name|team_goals|
|---|---|
|New Zealand|3| 
|London|5|

## Questions 6
Create some Active::Record Objects and define the associations that demonstrate the relationship between schools, students, classes and teachers as listed below
- A Student has many classes, has many teachers through those classes and has to belong to one school
- A Teacher has many classes, students through those classes and can belong to many schools
- A Teacher can have a head of department (**not sure about this one as there is no department resource**)

```ruby
class School < ActiveRecord::Base
  has_many :students
  has_many :teachers, -> { uniq }, :through => :students
end

class Student < ActiveRecord::Base
  has_many :classes
  has_many :teachers, :through => :classes
  belongs_to :school
end

class Teacher < ActiveRecord::Base
  has_many :classes
  has_many :students, :through => :classes
  has_many :schools, -> { uniq },  :through => :students
end

class Class < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher
end
```