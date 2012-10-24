#encoding: UTF-8
class HomeController < BaseController
  
  def index
  end

  def confirm
    @access_request = @access_request = Admin::AccessRequest.new
  end

  def weeding
  end

  def presents
  end
  
  def area
  end
  
  def about
  end
  
  def confirm_guest
    @admin_guest = Admin::Guest.find(params[:id])

    respond_to do |format|
      if @admin_guest.update_attribute(:has_confirmed, true)
        format.html { redirect_to confirmation_path, notice: 'Gracias. Acabas de confirmar tu asistencia a la boda. Recuerda indicar el número de acompañantes.' }
        format.json { head :no_content }
      else
        format.html { redirect_to confirmation_path, notice: 'No hemos podido confirmar tu asistencia. Si el problema persiste ponte en contacto con nosotros.' }
        format.json { render json: @admin_guest.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def cancel_guest
    @admin_guest = Admin::Guest.find(params[:id])

    respond_to do |format|
      if @admin_guest.update_attribute(:has_confirmed, false)
        format.html { redirect_to confirmation_path, notice: 'Es una pena oir eso :( Espramos que al final puedas asistir.' }
        format.json { head :no_content }
      else
        format.html { redirect_to confirmation_path, notice: 'No hemos podido confirmar tu asistencia. Si persiste ponte en contacto con nosotros.' }
        format.json { render json: @admin_guest.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update_guest
    @admin_guest = Admin::Guest.find(params[:id])

    respond_to do |format|
      if @admin_guest.update_attributes(params[:admin_guest])
        format.html { redirect_to confirmation_path, notice: 'Tu información se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { redirect_to confirmation_path, notice: 'Se ha producido un error.' }
        format.json { render json: @admin_guest.errors, status: :unprocessable_entity }
      end
    end
    
  end
end
