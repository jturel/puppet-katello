# Katello configuration for pulpcore

class katello::pulpcore {

  if $pulpcore::user {
    user { $pulpcore::user:
      group => $foreman::group,
    }
  }

}
