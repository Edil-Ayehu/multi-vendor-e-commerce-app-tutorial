import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/models/privacy_policy_model.dart';

class PrivacyPolicyController extends GetxController {
  static PrivacyPolicyController get to => Get.find();

  final RxBool _isVendor = false.obs;
  bool get isVendor => _isVendor.value;

  void setVendorStatus(bool status) {
    _isVendor.value = status;
  }

  List<PrivacyPolicyModel> getPrivacySections() {
    return [
      PrivacyPolicyModel(
        title: 'Information We Collect',
        content: isVendor
            ? '''We collect the following business information:
• Business name and registration details
• Contact information (email, phone, address)
• Bank account and payment processing details
• Tax identification numbers'''
            : '''We collect the following personal information:
• Name and contact details
• Device information
• Usage data and preferences
• Payment information''',
        icon: Icons.info_outline,
      ),
      PrivacyPolicyModel(
        title: 'Information We Collect',
        content: isVendor
            ? '''We collect the following business information:
• Business name and registration details
• Contact information (email, phone, address)
• Bank account and payment processing details
• Tax identification numbers
• Business licenses and permits
• Product information and inventory data
• Transaction history and sales records
• Store performance metrics'''
            : '''We collect the following personal information:
• Name and contact details
• Email address and phone number
• Shipping and billing addresses
• Payment information
• Purchase history
• Browsing behavior and preferences
• Device information and IP address
• Customer service interactions''',
        icon: Icons.info_outline,
      ),
      PrivacyPolicyModel(
        title: 'How We Use Your Information',
        content: isVendor
            ? '''We use vendor information to:
• Process payments and transfers
• Verify business credentials
• Monitor store performance
• Improve platform services
• Ensure compliance with policies
• Send important updates
• Analyze market trends
• Prevent fraud and abuse'''
            : '''We use customer information to:
• Process orders and payments
• Deliver products
• Provide customer support
• Personalize shopping experience
• Send order updates
• Improve our services
• Prevent fraud
• Marketing communications (with consent)''',
        icon: Icons.psychology,
      ),
      PrivacyPolicyModel(
        title: 'Data Security',
        content: '''We protect your data through:
• Industry-standard encryption
• Secure payment processing
• Regular security audits
• Access control measures
• Data backup systems
• Breach detection monitoring
• Employee training
• Third-party security certifications''',
        icon: Icons.security,
      ),
      PrivacyPolicyModel(
        title: 'Data Sharing',
        content: isVendor
            ? '''Your business information may be shared with:
• Payment processors
• Shipping partners
• Tax authorities
• Legal authorities when required
• Platform service providers
• Analytics services
• Fraud prevention services
• Marketing partners (with consent)'''
            : '''Your personal information may be shared with:
• Vendors fulfilling your orders
• Payment processors
• Shipping companies
• Customer support services
• Analytics providers
• Marketing services (with consent)
• Legal authorities when required
• Fraud prevention services''',
        icon: Icons.share,
      ),
      PrivacyPolicyModel(
        title: 'Your Rights',
        content: '''You have the right to:
• Access your personal data
• Request data correction
• Delete your account
• Export your data
• Opt-out of marketing
• Withdraw consent
• File a complaint
• Request data limitation''',
        icon: Icons.gavel,
      ),
      PrivacyPolicyModel(
        title: 'Cookies and Tracking',
        content: '''We use cookies and similar technologies to:
• Remember your preferences
• Maintain session information
• Analyze platform usage
• Improve user experience
• Personalize content
• Track marketing effectiveness
• Detect fraud
• Ensure platform security''',
        icon: Icons.cookie,
      ),
      PrivacyPolicyModel(
        title: 'Data Retention',
        content: '''Our data retention policies:
• Account data: Until account deletion
• Transaction records: 7 years
• Communication history: 2 years
• Marketing preferences: Until opt-out
• Security logs: 1 year
• Analytics data: 3 years
• Backup data: 30 days
• Deleted data: 90 days recovery period''',
        icon: Icons.storage,
      ),
      PrivacyPolicyModel(
        title: 'International Data Transfer',
        content: '''For international data transfers:
• Use of standard contractual clauses
• Compliance with local regulations
• Data protection agreements
• Server location disclosure
• Transfer impact assessments
• Security measures during transfer
• User notification requirements
• Transfer limitation options''',
        icon: Icons.language,
      ),
      PrivacyPolicyModel(
        title: 'Updates to Privacy Policy',
        content: '''Policy update procedures:
• Regular policy reviews
• Notification of material changes
• 30-day advance notice
• Email notifications
• In-app announcements
• Version history maintenance
• User acknowledgment process
• Opt-out options when applicable''',
        icon: Icons.update,
      ),
      PrivacyPolicyModel(
        title: 'Contact Information',
        content: '''For privacy-related inquiries:
• Email: privacy@example.com
• Phone: +1-234-567-8900
• Address: Privacy Office, Example Street
• Online form: privacy.example.com
• Response time: 48 hours
• Data protection officer: John Doe
• Regulatory authority contacts
• Emergency contact procedures''',
        icon: Icons.contact_mail,
      ),
    ];
  }
}
