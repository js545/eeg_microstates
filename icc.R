library('ICC')

df = read.csv('~/Desktop/all_statistics.csv')

rs = subset(df, filetype=='resting_state')
mv = subset(df, filetype=='video4')

sub_list = df[c(duplicated(df['subject'])), ]['subject']

rs_vals = c()
mv_vals = c()

for (v in 1:dim(sub_list)[1]) {
  
  sub = sub_list[v, 1]
  
  rs_val = subset(rs, subject==sub)$coverage4
  mv_val = subset(mv, subject==sub)$coverage4
  
  rs_vals = c(rs_vals, rs_val)
  mv_vals = c(mv_vals, mv_val)
  
}

occurence1 <- data.frame(sub_list, rs_values=rs_vals, video4_values=mv_vals)

# ICCbare(x=factor(rs_values), y=video4_values, data=occurence1)
cor(rs_vals, mv_vals)
