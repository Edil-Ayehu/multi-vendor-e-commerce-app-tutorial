import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/models/terms_conditions_model.dart';

class TermsConditionsController extends GetxController {
  static TermsConditionsController get to => Get.find();

  final RxBool _isVendor = false.obs;
  bool get isVendor => _isVendor.value;

  void setVendorStatus(bool status) {
    _isVendor.value = status;
  }

  List<TermsConditionsModel> getTermsSections() {
    return [
      TermsConditionsModel(
        title: isVendor ? 'Seller Obligations' : 'User Obligations',
        content: isVendor
            ? '''As a vendor on our platform, you agree to:
• Provide accurate and up-to-date information about your business
• Maintain high quality standards for all products
• Ship orders within the promised timeframe
• Respond to customer inquiries within 24 hours
• Comply with all applicable laws and regulations
• Maintain accurate inventory records
• Honor all valid warranties and returns
• Keep pricing fair and transparent'''
            : '''As a user of our platform, you agree to:
• Provide accurate personal information
• Maintain the security of your account
• Use the platform for legitimate purchases only
• Pay for items ordered through the platform
• Respect intellectual property rights
• Follow our community guidelines
• Not engage in fraudulent activities
• Report any suspicious activities''',
        icon: Icons.assignment,
      ),
      const TermsConditionsModel(
        title: 'Prohibited Activities',
        content: '''The following activities are strictly prohibited:
• Fraudulent transactions or activities
• Harassment or abuse of other users
• Posting false or misleading information
• Unauthorized use of others' personal information
• Manipulation of ratings or reviews
• Spam or unsolicited promotional content
• Violation of intellectual property rights
• Use of automated bots or scripts''',
        icon: Icons.block,
      ),
      TermsConditionsModel(
        title: 'Payment Terms',
        content: isVendor
            ? '''• Payment processing fee: 2.5% per transaction
• Settlement period: 7 business days
• Minimum payout threshold: \$50
• Supported payment methods: Bank transfer, Digital wallets
• Chargeback handling process
• Refund processing timeline
• Tax obligations and reporting
• Currency conversion rates'''
            : '''• Secure payment processing
• Accepted payment methods
• Refund and cancellation policies
• Protection against unauthorized charges
• Dispute resolution process
• Price matching policies
• Gift card terms
• Special promotion conditions''',
        icon: Icons.payment,
      ),
      const TermsConditionsModel(
        title: 'Account Management',
        content: '''• Account creation and verification
• Password and security requirements
• Account suspension conditions
• Data retention policies
• Account deletion process
• Multiple account restrictions
• Account recovery procedures
• Access limitations''',
        icon: Icons.manage_accounts,
      ),
      const TermsConditionsModel(
        title: 'Intellectual Property',
        content: '''• Copyright protection
• Trademark usage guidelines
• Content ownership rights
• License grants
• User-generated content rights
• Brand asset usage
• Patent rights
• Content removal procedures''',
        icon: Icons.copyright,
      ),
      const TermsConditionsModel(
        title: 'Dispute Resolution',
        content: '''• Conflict resolution process
• Arbitration procedures
• Mediation options
• Legal jurisdiction
• Notice requirements
• Time limitations
• Appeal process
• Binding decisions''',
        icon: Icons.balance,
      ),
      const TermsConditionsModel(
        title: 'Termination',
        content: '''• Account termination conditions
• Notice requirements
• Refund policies
• Data retention after termination
• Appeal process
• Reinstatement conditions
• Final settlement terms
• Outstanding obligations''',
        icon: Icons.exit_to_app,
      ),
      const TermsConditionsModel(
        title: 'Modifications to Terms',
        content: '''• Right to modify terms
• Notice of changes
• Continued use constitutes acceptance
• Material changes notification
• Opt-out options
• Previous version accessibility
• Effective dates
• User acknowledgment requirements''',
        icon: Icons.update,
      ),
      if (isVendor)
        const TermsConditionsModel(
          title: 'Commission Structure',
          content: '''• Base commission rates by category
• Volume-based discounts
• Special promotion rates
• Payment processing fees
• Additional service charges
• Tax implications
• Settlement schedule
• Bonus program terms''',
          icon: Icons.monetization_on,
        ),
    ];
  }
}
