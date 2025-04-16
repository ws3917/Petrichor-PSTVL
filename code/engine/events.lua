return function ()
   love.event.pump()
   for name, a, b, c, d, e, f in love.event.poll() do
      if name == "quit" then
         if not love.quit or not love.quit() then
            return a or 0
         end
      end
      love.handlers[name](a, b, c, d, e, f)
   end
end