import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uvoting_app/screens/dashboard_screen.dart';
import 'package:local_auth/local_auth.dart';


// USER SCREENS (ensure these exist)
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/election_screen.dart';
import 'screens/election_detailed_screen.dart';
import 'screens/candidate_screen.dart';
import 'screens/verify_identity_screen.dart';
import 'screens/face_scan_screen.dart';
import 'screens/vote_confirmation_screen.dart';
import 'screens/already_vote_screen.dart';
import 'screens/result_screen.dart';

// ADMIN SCREENS (ensure these exist)
import 'admin_screens/admin login.dart';
import 'admin_screens/admin_dashboard.dart';
import 'admin_screens/manage_position_screen.dart';
import 'admin_screens/add_candidate_screen.dart';
import 'admin_screens/election_control_screen.dart';
import 'admin_screens/results _screen.dart';
import 'admin_screens/final_results_screen.dart';

final router = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) =>
      const UserDashboardScreen(),
    ),

    GoRoute(path: '/welcome', builder: (ctx, st) => const WelcomeScreen()),
    GoRoute(path: '/login', builder: (ctx, st) => const LoginScreen()),
    GoRoute(path: '/elections', builder: (ctx, st) => const ElectionsScreen()),
    GoRoute(
      path: '/election/:id',
      builder: (ctx, st) {
        // Replace with your real data source
        final id = st.pathParameters['id']!;
        final election = {"id": id, "title": "Election $id", "status": "ACTIVE"};
        return ElectionDetailScreen(election: Map<String, String>.from(election));
      },
    ),
    GoRoute(
      path: '/candidate/:name',
      builder: (ctx, st) => CandidateScreen(candidate: st.pathParameters['name']!),
    ),
    GoRoute(
      path: '/verify/:name',
      builder: (ctx, st) => VerifyIdentityScreen(candidate: st.pathParameters['name']!),
    ),
    GoRoute(
      path: '/face/:name',
      builder: (ctx, st) => FaceScanScreen(candidate: st.pathParameters['name']!),
    ),
    GoRoute(path: '/confirm', builder: (ctx, st) => const VoteConfirmationScreen()),
    GoRoute(path: '/already-voted', builder: (ctx, st) => const AlreadyVoteScreen()),
    GoRoute(
      path: '/results/:id',
      builder: (ctx, st) => ResultsScreen(electionId: st.pathParameters['id']!),
    ),

    // ADMIN
    GoRoute(path: '/admin/login', builder: (ctx, st) => const AdminLoginScreen()),
    GoRoute(path: '/admin', builder: (ctx, st) => const AdminDashboardScreen()),
    GoRoute(path: '/admin/positions', builder: (ctx, st) => const ManagePositionsScreen()),
    GoRoute(path: '/admin/add-candidate', builder: (ctx, st) => const AddCandidateScreen()),
    GoRoute(path: '/admin/control', builder: (ctx, st) => const ElectionControlScreen()),
    GoRoute(path: '/admin/analytics', builder: (ctx, st) => const ResultsAnalyticsScreen()),
    GoRoute(
      path: '/admin/final-results/:id',
      builder: (ctx, st) => FinalResultsScreen(electionId: st.pathParameters['id']!),
    ),
  ],
);

