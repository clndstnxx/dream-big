class UpdateAllFk < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :answers, :assessments, ondelete: :cascade, column: :assessment_id
    add_foreign_key :category_questions, :assessments, ondelete: :cascade, column: :assessment_id
    add_foreign_key :planets, :journeys, ondelete: :cascade, column: :journey_id
    add_foreign_key :sections, :planets, ondelete: :cascade, column: :planet_id
    add_foreign_key :plans, :sections, ondelete: :cascade, column: :section_id
    add_foreign_key :goals, :sections, ondelete: :cascade, column: :section_id
    add_foreign_key :reflections, :sections, ondelete: :cascade, column: :section_id
    add_foreign_key :reflections, :goals, ondelete: :cascade, column: :goal_id
    add_foreign_key :journeys, :students, ondelete: :cascade, column: :student_id
  end

end