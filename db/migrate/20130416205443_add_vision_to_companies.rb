class AddVisionToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :vision, :text
    c = Company.find("joust")
    c.update_attributes(vision: "Joust strives to augment clarity in the world of communication.We seek to increase transparency by tackling issues such as misaligned expectations and tool ineffectiveness, while minimizing inefficiencies for our clients and their customers. Conquer is Joust's first implementation and will position Joust as a stable supplier of dynamic, cloud-based communication solutions.")
  end
end
