class CreateTables < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.text :name
      t.integer :value
      t.text :description
      t.text :relationship
      t.text :expert_opinion
      t.text :general_status
      t.text :self_description
      t.text :short_description
    end

    create_table :subtypes do |t|
      t.text :description
      t.integer :value
      t.belongs_to :type, index: true, null: false
    end

    create_table :results do |t|
      t.text :name
      t.integer :age
      t.integer :rect
      t.integer :circle
      t.integer :triangle
      t.attachment :image
      t.timestamps null: false
      t.belongs_to :subtype, index: true, null: false
    end

    create_table :questions do |t|
      t.text :question
      t.text :description
    end

    create_table :questions_results, id: false do |t|
      t.belongs_to :question, index: true
      t.belongs_to :result, index: true
    end
  end
end
