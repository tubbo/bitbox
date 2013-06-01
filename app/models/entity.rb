class Entity < ActiveRecord::Base
  validates :name, presence: true

  def file_name
    @file_name ||= File.basename name
  end

  def path
    @file_path ||= file.path
  end

  def size
    @total_size ||= file.size
  end

  def last_modified_at
    @last_modified_at ||= Date.parse file.last_modified
  end

private
  def file
    File.new name
  end
end
