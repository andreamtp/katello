#
# Copyright 2011 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

class Api::TasksController < Api::ApiController
  respond_to :json
  before_filter :find_organization, :only => [:index]

  def index
    render :json => Delayed::Job.where(:organization_id => @organization).to_json(:except => :handler)
  end

  def show
    render :json => Delayed::Job.find_by_uuid(params[:id]).to_json(:except => :handler)
  end
end
