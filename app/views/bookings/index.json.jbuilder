json.array! @bookings do |booking|
  json.extract! 	 booking, :id
  json.title			 booking.device.fullname if params[:user_id]
	json.title			 booking.user.fullname if params[:device_id]
  json.start 			 booking.start_time.in_time_zone(booking.device.time_zone)
  json.end	 			 booking.end_time.in_time_zone(booking.device.time_zone)
  json.allDay			 booking.all_day
end