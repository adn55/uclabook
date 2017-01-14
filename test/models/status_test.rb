require 'test_helper'

class StatusTest < ActiveSupport::TestCase

test "un status requiere contenido" do
	status = Status.new
	assert !status.save
	assert !status.save
	assert !status.errors[:contenido].empty?
end

test "cada status debe contener al menos dos letras" do
status = Status.new
status.contenido = "B"
assert !status.save
assert !status.errors[:contenido].empty?
end

test "cada status debe tener un user id"
status = Status.new
status.contenido = "Hello Word"
assert !status.save
assert !status.errors[:user_id].empty?
end
