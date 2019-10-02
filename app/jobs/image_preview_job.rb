class ImagePreviewJob < ApplicationJob
  queue_as :default
  def preview(image)
    <ul>
      <% images.each do |image| %>
        <% if image.id.present? %>
          <li class="image-area">
            <p class="image-content"><%= image_tag image.main_image.url %></p>
          </li>
          <% else %>
          <li class="image-area">
            <p class="image-content"><%= image_tag image.sub_image %></p>
          </li>
        <% end %>
      <% end %>
    </ul>
  end
end
