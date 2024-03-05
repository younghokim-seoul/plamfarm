# palmfarm

palmfrarm client

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



typedef ChannelEventCallback = void Function(TPChannel channel);
typedef MemberEventCallback = void Function(
TPChannel channel, List<TPMember> users);
typedef MessageEventCallback = void Function(
TPChannel channel, TPMessage message);

class ChannelListener {
const ChannelListener(
{
this.onMemberAdded,
this.onMemberLeft,
this.onMessageReceived,
this.onMessageDeleted,
this.onChannelAdded,
this.onChannelChanged,
this.onChannelRemoved,
this.onPublicMemberAdded,
this.onPublicMemberLeft,
this.onPublicChannelAdded,
this.onPublicChannelChanged,
this.onPublicChannelRemoved,
this.onMemberMuted,
this.onPublicMemberMuted,
this.onMemberUnMuted,
this.onPublicMemberUnMuted
});

final MemberEventCallback? onMemberAdded;
final MemberEventCallback? onMemberLeft;
final MessageEventCallback? onMessageReceived;
final MessageEventCallback? onMessageDeleted;
final ChannelEventCallback? onChannelAdded;
final ChannelEventCallback? onChannelChanged;
final ChannelEventCallback? onChannelRemoved;
final MemberEventCallback? onPublicMemberAdded;
final MemberEventCallback? onPublicMemberLeft;
final ChannelEventCallback? onPublicChannelAdded;
final ChannelEventCallback? onPublicChannelChanged;
final ChannelEventCallback? onPublicChannelRemoved;
final MemberEventCallback? onMemberMuted;
final MemberEventCallback? onPublicMemberMuted;
final MemberEventCallback? onMemberUnMuted;
final MemberEventCallback? onPublicMemberUnMuted;
}
