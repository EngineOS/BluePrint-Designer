class AddWorkerReferencestoSoftware < ActiveRecord::Migration
  def change
	add_reference :softwares,  :work_port
	add_reference :softwares,  :worker_command
	add_reference :softwares,  :blocking_worker

  end
end
