## 1.0.0 (2016/4/19)

Change:

- Re-release as `sh-pathctl` and rename `pathctl.bash` to `pathctl.shrc`.

## 0.9.3 (2016/4/19)

Feature:

- `pathctl_unshift_f <target>`: always insert target at the first position in PATH
- `pathctl_push_f <target>`: always append target at the last position in PATH

## 0.9.2 (2016/4/19)

Feature:

- `pathctl_uniq` to remove duplicates in PATH

Change:

- Don't use `$IFS` in `pathctl_show` for portability

## 0.9.1 (2016/4/16)

Fix:

- Don't use variable `$path` because it's used in `zsh`

## 0.9.0 (2016/4/15)

Initial release.
