import 'package:equatable/equatable.dart';
import '../profile/profile.dart';

class Profile extends Equatable {
  final String? email, name, avatar, fullname, gender, phone, address, dob;

  const Profile(this.email, this.name, this.avatar, this.fullname, this.gender,
      this.phone, this.address, this.dob);

  @override
  List<Object?> get props =>
      [email, name, avatar, fullname, gender, phone, address, dob];

  factory Profile.fromDTO(ProfileJson? dto) => Profile(dto?.email, dto?.name,
      dto?.avatar, dto?.fullname, dto?.gender, dto?.phone, dto?.address, dto?.dob);
}
