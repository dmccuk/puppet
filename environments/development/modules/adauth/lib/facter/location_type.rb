Facter.add("location_type") do
  setcode do
    Facter.value(:hostname)[8..8]
  end
end

