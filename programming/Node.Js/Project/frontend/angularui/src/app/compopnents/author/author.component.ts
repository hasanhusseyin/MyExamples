import { Component, OnInit } from '@angular/core';
import { AuthorService } from 'src/app/services/author.service';
import { Author } from './author';

@Component({
  selector: 'app-author',
  templateUrl: './author.component.html',
  styleUrls: ['./author.component.css'],
  providers: [AuthorService],
})
export class AuthorComponent implements OnInit {
  constructor(private authorService: AuthorService) {}

  authors!: Author[];

  ngOnInit(): void {
    this.getAuthors;
  }

  getAuthors() {
    this.authorService.getAuthors().subscribe((data) => {
      this.authors = data;
     
    });
  }
}
