ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Últimos usuarios agregados" do
          ul do
            User.last(5).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel "Usuarios" do
          ul do
            li "Usuarios registrados: #{User.count}"
            li "Administradores registrados: #{AdminUser.count}"
          end
        end
      end

    end
  end # content
end
