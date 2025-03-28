import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/screens/faq_details_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/faq_category.dart';
import '../models/faq_item.dart';

class HelpCenterController extends GetxController {
  static HelpCenterController get to => Get.find();
  
  final supportEmail = 'edilayehu534027@gmail.com';
  final supportPhone = '+251930884402';

  Future<void> launchEmail(BuildContext context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: supportEmail,
      queryParameters: {
        'subject': 'Customer Support Request',
        'body': 'Hello, I need help with...',
      },
    );

    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      showErrorDialog(context, 'Could not launch email client');
    }
  }

  Future<void> launchPhone(BuildContext context) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: supportPhone,
    );

    try {
      await launchUrl(phoneLaunchUri);
    } catch (e) {
      showErrorDialog(context, 'Could not launch phone app');
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  List<FAQCategory> getFAQCategories() {
    return [
      FAQCategory(
        icon: Icons.shopping_bag,
        title: 'Orders & Shipping',
        subtitle: 'Track, cancel, or return orders',
      ),
      FAQCategory(
        icon: Icons.payments,
        title: 'Payments & Refunds',
        subtitle: 'Payment methods, refund status',
      ),
                        FAQCategory(
                
                    icon: Icons.account_circle,
                    title: 'Account & Profile',
                    subtitle: 'Login issues, account settings',
                  ),
                  FAQCategory(
                 
                    icon: Icons.security,
                    title: 'Security & Privacy',
                    subtitle: 'Password, personal data',
                  ),
                  FAQCategory(
                   
                    icon: Icons.local_shipping,
                    title: 'Delivery Issues',
                    subtitle: 'Delays, tracking problems',
                  ),
                  FAQCategory(
                   
                    icon: Icons.assignment_return,
                    title: 'Returns & Exchanges',
                    subtitle: 'Return policy, exchange process',
                  ),
                  FAQCategory(
                    
                    icon: Icons.card_giftcard,
                    title: 'Promotions & Discounts',
                    subtitle: 'Coupons, special offers',
                  ),
                  FAQCategory(
                   
                    icon: Icons.store,
                    title: 'Product Information',
                    subtitle: 'Specifications, availability',
                  ),
    ];
  }

void navigateToFAQDetails(String title) {
  Get.to(() => FAQDetailsScreen(
    title: title,
    faqItems: getFAQItems(title),
  ));
}

  List<FAQItem> getFAQItems(String category) {
  switch (category) {

      case 'Orders & Shipping':
          return [
            FAQItem(
              question: 'How can I track my order?',
              answer:
                  'You can track your order by going to "My Orders" in your account and clicking on the specific order. You\'ll see real-time updates on your order status and location.',
            ),
            FAQItem(
              question: 'What is the estimated delivery time?',
              answer:
                  'Standard delivery typically takes 3-5 business days. Express delivery is available for 1-2 business days. International shipping may take 7-14 business days.',
            ),
            FAQItem(
              question: 'Can I cancel my order?',
              answer:
                  'Orders can be cancelled within 1 hour of placement if they haven\'t been processed. Go to "My Orders" and look for the cancel option on eligible orders.',
            ),
            FAQItem(
              question: 'How do I return an item?',
              answer:
                  'To return an item, go to "My Orders," select the order and item, choose "Return Item," and follow the instructions. Returns must be initiated within 30 days of delivery.',
            ),
          ];

        case 'Payments & Refunds':
          return [
            FAQItem(
              question: 'What payment methods are accepted?',
              answer:
                  'We accept credit/debit cards (Visa, MasterCard, American Express), PayPal, Apple Pay, Google Pay, and bank transfers. Some regions may have additional local payment options.',
            ),
            FAQItem(
              question: 'How long do refunds take?',
              answer:
                  'Refunds typically process within 5-7 business days after we receive and inspect the returned item. The actual time to see the funds may vary depending on your payment method and bank.',
            ),
            FAQItem(
              question: 'Is my payment information secure?',
              answer:
                  'Yes, we use industry-standard SSL encryption and comply with PCI DSS requirements to ensure your payment information is secure. We never store complete credit card details.',
            ),
            FAQItem(
              question: 'What happens if my payment fails?',
              answer:
                  'If your payment fails, the order won\'t be processed. You\'ll receive a notification and can try again with the same or different payment method. Check your card details and available balance.',
            ),
          ];

        case 'Account & Profile':
          return [
            FAQItem(
              question: 'How do I reset my password?',
              answer:
                  'Click "Forgot Password" on the login screen, enter your email address, and follow the instructions sent to your email to create a new password.',
            ),
            FAQItem(
              question: 'Can I change my email address?',
              answer:
                  'Yes, you can change your email address in Account Settings. You\'ll need to verify the new email address before the change takes effect.',
            ),
            FAQItem(
              question: 'How do I update my shipping address?',
              answer:
                  'Go to Account Settings > Addresses to add, edit, or remove shipping addresses. You can also save multiple addresses and set a default one.',
            ),
            FAQItem(
              question: 'What should I do if my account is locked?',
              answer:
                  'If your account is locked, contact customer support with your account email. This usually happens due to multiple failed login attempts or suspicious activity.',
            ),
          ];

        case 'Security & Privacy':
          return [
            FAQItem(
              question: 'How is my personal data protected?',
              answer:
                  'We use advanced encryption and security measures to protect your data. Our privacy policy details how we collect, use, and protect your information in compliance with GDPR and other regulations.',
            ),
            FAQItem(
              question: 'Can I enable two-factor authentication?',
              answer:
                  'Yes, go to Account Settings > Security to enable two-factor authentication. You can choose between SMS or authenticator app verification.',
            ),
            FAQItem(
              question: 'How do I report suspicious activity?',
              answer:
                  'If you notice any suspicious activity, immediately contact our security team through the Help Center or email security@example.com. Change your password as a precaution.',
            ),
            FAQItem(
              question: 'What happens to my data if I delete my account?',
              answer:
                  'When you delete your account, your personal data is permanently removed after 30 days. Some information may be retained for legal requirements or fraud prevention.',
            ),
          ];

        case 'Delivery Issues':
          return [
            FAQItem(
              question: 'What causes delivery delays?',
              answer:
                  'Delivery delays can be caused by various factors such as weather conditions, transportation issues, or customs clearance. We apologize for any inconvenience this may cause.',
            ),
            FAQItem(
              question: 'How can I track my delivery?',
              answer:
                  'You can track your delivery using the tracking number provided in your order confirmation email. You can also contact our support team for updates.',
            ),
          ];

        case 'Returns & Exchanges':
          return [
            FAQItem(
              question: 'How do I return an item?',
              answer:
                  'To return an item, go to "My Orders," select the order and item, choose "Return Item," and follow the instructions. Returns must be initiated within 30 days of delivery.',
            ),
            FAQItem(
              question: 'What is the return policy?',
              answer:
                  'Our return policy allows for returns within 30 days of delivery. Items must be in their original packaging and in the same condition as received.',
            ),
          ];

        case 'Promotions & Discounts':
          return [
            FAQItem(
              question: 'How do I redeem a coupon?',
              answer:
                  'To redeem a coupon, go to the checkout page, enter the coupon code in the "Discount Code" field, and click "Apply." The discount will be applied to your order total.',
            ),
            FAQItem(
              question: 'What are the terms of a promotion?',
              answer:
                  'Promotions have specific terms and conditions. Please read the promotion details carefully before participating. Some promotions may have limited availability or time restrictions.',
            ),
          ];

        case 'Product Information':
          return [
            FAQItem(
              question: 'How do I find product specifications?',
              answer:
                  'You can find product specifications in the product description or on the product page. You can also contact our support team for more information.',
            ),
            FAQItem(
              question: 'How do I check product availability?',
              answer:
                  'You can check product availability in the product description or on the product page. You can also contact our support team for more information.',
            ),
          ];
    default:
      return [];
  }
}
}
