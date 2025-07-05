sealed class Sponsor {
  const Sponsor({
    required this.id,
    required this.name,
    required this.slug,
    required this.logoUrl,
  });

  final String id;
  final String name;
  final String slug;
  final String logoUrl;
}

sealed class CompanySponsor extends Sponsor {
  const CompanySponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
  });
}

sealed class NamingRight {
  const NamingRight();
}

final class NotAppliedNamingRight extends NamingRight {
  const NotAppliedNamingRight();
}

sealed class AppliedNamingRight extends NamingRight {
  const AppliedNamingRight({
    required this.name,
  });

  final String name;
}

final class HallNamingRight extends AppliedNamingRight {
  const HallNamingRight({
    required super.name,
  });
}

final class RoomNamingRight extends AppliedNamingRight {
  const RoomNamingRight({
    required super.name,
  });
}

final class PlatinumSponsor extends CompanySponsor {
  PlatinumSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    this.namingRight = const NotAppliedNamingRight(),
    this.namePlate = false,
    this.scholarship = false,
  });

  final NamingRight namingRight;
  final bool namePlate;
  final bool scholarship;
}

final class GoldSponsor extends CompanySponsor {
  GoldSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    this.namingRight,
    this.namePlate = false,
    this.scholarship = false,
  });

  final NamingRight? namingRight;
  final bool namePlate;
  final bool scholarship;
}

final class SilverSponsor extends CompanySponsor {
  SilverSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    this.namingRight,
    this.namePlate = false,
    this.lunchSponsor = false,
    this.scholarship = false,
  });

  final NamingRight? namingRight;
  final bool namePlate;
  final bool lunchSponsor;
  final bool scholarship;
}

final class BronzeSponsor extends CompanySponsor {
  BronzeSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    this.namePlate = false,
    this.lunchSponsor = false,
    this.scholarship = false,
  });

  final bool namePlate;
  final bool lunchSponsor;
  final bool scholarship;
}

final class OtherSponsor extends CompanySponsor {
  OtherSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    this.scholarship = false,
  });

  final bool scholarship;
}

final class IndividualSponsor extends Sponsor {
  IndividualSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
  });
}
