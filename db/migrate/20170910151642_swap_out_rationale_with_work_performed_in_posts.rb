class SwapOutwork_performedWithWorkPerformedInPosts < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :rationale, :work_performed
  end
end
