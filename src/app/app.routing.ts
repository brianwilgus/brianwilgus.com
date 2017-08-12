import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { WelcomeComponent } from './welcome/welcome.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { SkillsComponent } from './skills/skills.component';
import { WorkHistoryComponent } from './work-history/work-history.component';
import { ContactComponent } from './contact/contact.component';

export const Routing: ModuleWithProviders = RouterModule.forRoot([
    { path: 'about', component: WelcomeComponent },
    { path: 'skills', component: SkillsComponent },
    { path: 'work-history', component: WorkHistoryComponent },
    { path: 'contact', component: ContactComponent },
    { path: '', redirectTo: '/about', pathMatch: 'full' },
    { path: '**', component: PageNotFoundComponent }
], { useHash: false, enableTracing: false });
