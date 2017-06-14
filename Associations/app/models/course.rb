class Course < ActiveRecord::Base

  has_many :enrollments,
    class_name: "Enrollment",
    foreign_key: :course_id,
    primary_key: :id


  has_many(
    :enrolled_students,
    through: :enrollments,
    source: :user
  )

  has_many(
    :follow_up_courses,
    class_name: "Course",
    foreign_key: :prereq_id,
    primary_key: :id
  )

  belongs_to(
    :prerequisite,
    class_name: "Course",
    foreign_key: :prereq_id,
    primary_key: :id
  )

  belongs_to(
    :instructor,
    class_name: "User",
    foreign_key: :instructor_id,
    primary_key: :id
  )

end
