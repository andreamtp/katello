#
# Copyright 2013 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.


module NavigationHelper

  def generate_menu
    main_menu   = Experimental::Navigation::Menus::Main.new(current_organization)
    site_menu   = Experimental::Navigation::Menus::Site.new
    user_menu   = Experimental::Navigation::Menus::User.new(current_user)

    menu = {
      :location => 'left',
      :items => main_menu.items
    }

    site_menu = {
      :location => 'right',
      :items    => site_menu.items
    }

    user_menu = {
      :location => 'right',
      :items    => [user_menu]
    }

    javascript do
      ("KT.main_menu = " + menu.to_json + ";\n").html_safe +
      ("KT.admin_menu = " + site_menu.to_json + ";\n").html_safe +
      ("KT.user_menu = " + user_menu.to_json + ";\n").html_safe +
      ("KT.notices = " + add_notices.to_json + ";\n").html_safe
    end
  end

  def add_notices
    return {
      :count          => Notice.for_user(current_user).for_org(current_organization).count.to_s,
      :url            => notices_path,
      :new_notices_url   => notices_get_new_path
    }
  end

end
