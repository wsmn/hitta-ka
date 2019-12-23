<div id="nav" class="bg-gray-900" data-behaviour="vue">
	<div class="px-1 lg:px-6">
	  <nav class="relative w-full flex justify-between lg:justify-end py-3 lg:py-2">
      <div class="ml-3 mt-2 lg:hidden">
        <%= link_to(root_path) do %>
          <%= image_tag('apti_logo.svg', alt: "Home", style:"width: 3.25rem", class: "") %>
        <% end %>
      </div>
      <div class="lg:bg-gray-100 rounded flex items-center mt-1 lg:mt-5 lg:px-5">
        <navigation
          :signed-in="<%= signed_in? %>"
          :links='<%= header_links %>'
          :account-link='<%= account_link %>'
          :connect-link='<%= connect_link %>'
          :sign-in='<%= sign_in_link %>'
          :sign-out='<%= sign_out_link %>'
          :authenticity='"<%= form_authenticity_token %>"'
        ></navigation>
        <div class="hidden lg:block lg:flex lg:bg-transparent text-gray-900 text-base font-normal">
          <div class="inset-0 flex items-center py-2">
            <div class="border-r border-gray-500 h-8 flex items-center">
              <%= link_to(root_path) do %>
                <%= image_tag('apti_logo.svg', alt: "Home", style:"width: 2.75rem", class: "mr-5") %>
              <% end %>
            </div>
            <%= link_to(t('application.header.home'), root_url, class: "text-blue-600 hover:text-gray-600 ml-5 mr-5") %>
            <%= link_to(t('application.header.map'), map_url, class: "hover:text-gray-600 mr-5") %>
            <%= link_to(t('application.header.kontrollansvarig'), kontrollansvarig_url, class: "hover:text-gray-600 mr-5") %>
            <%= link_to(t('application.header.about'), about_url, class: "hover:text-gray-600 mr-5") %>
          </div>
          <div class="relative flex items-center text-black">
            <div class="border-l border-gray-500 h-6 flex items-center">
            <% if signed_in? %>
            <div class="w-1/4 md:w-auto md:flex text-right ml-5 relative group">
              <div>
                <%= image_tag('profile_pic.svg', class:"inline-block h-6 w-6 border border-blue-600 rounded-full")%>
              </div>
              <div class="hidden md:block md:flex md:items-center ml-2">
                <span class="text-gray-900 text-base mr-1"><%= current_user.name %></span>
                <div>
                  <svg class="fill-current text-gray-900 h-4 w-4 block opacity-50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M4.516 7.548c.436-.446 1.043-.481 1.576 0L10 11.295l3.908-3.747c.533-.481 1.141-.446 1.574 0 .436.445.408 1.197 0 1.615-.406.418-4.695 4.502-4.695 4.502a1.095 1.095 0 0 1-1.576 0S4.924 9.581 4.516 9.163c-.409-.418-.436-1.17 0-1.615z"/></svg>
                </div>
              </div>
            </div>
              <%= link_to(account_path, class: "text-blue-600 font-bold hover:text-gray-600 mr-5 ml-5") do %>
                <%= t('application.header.account') %>
              <% end %>
              <%= link_to(sign_out_path, method: 'delete', class: "text-gray-900 font-bold hover:text-gray-600") do %>
                <%= t('application.header.sign_out') %>
                <%= icon('fas', 'sign-out-alt', class: 'ml-1 text-gray-900 hover:text-gray-600')%>
              <% end %>
            <% else %>
              <%= link_to(sign_in_path, class: "text-blue-600 hover:text-gray-600 mr-5 ml-5") do %>
                <%= t('application.header.sign_in') %>
              <% end %>
              <%= link_to(connect_path, class: "bg-blue-600 text-white hover:bg-blue-700 hover:border-blue-700 hover:text-white border border-blue-600 py-1 px-2 rounded") do %>
                <%= t('application.header.connect_company') %>
              <% end %>
            <% end %>
          </div>
          </div>
        </div>
      </div>
    </nav>
  </div>
</div>
