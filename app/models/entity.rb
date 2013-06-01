class Entity < ActiveRecord::Base
  belongs_to :folder

  validates :folder_id, presence: true
  validates :name, presence: true

  def file_name
    @file_name ||= File.basename name
  end

  def path
    @file_path ||= File.expand_path "#{folder.path}/#{name}"
  end

  def size
    @total_size ||= file.size
  end

  def last_modified_at
    @last_modified_at ||= file.mtime
  end

private
  def file
    @reference ||= File.stat path
  end
end
