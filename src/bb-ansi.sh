#!/usr/bin/env bb-import
# shellcheck disable=SC2015,SC2155,SC2181
# ==================================================================
# bb-ansi
# ==================================================================
# BB-ANSI Library File
#
# File:         bb-ansi
# Author:       Ragdata
# Date:         15/04/2023
# License:      MIT License
# Copyright:    Copyright © 2023 Darren (Ragdata) Poulton
# ==================================================================
# DEPENDENCIES
# ==================================================================
bb-import bb-functions/is
# ==================================================================
# VARIABLES
# ==================================================================
#
# BUILD VARIABLES
#
declare -gx ANSI_BUILD="x"
declare -gx ANSI_VERSION="v-1.0.0"
declare -gx ANSI_BUILD_DATE="20230718-0033"
#
# SYMBOLS
#
[[ -z "${SYMBOL_ERROR}" ]] && declare -gx SYMBOL_ERROR="🚫"
[[ -z "${SYMBOL_WARNING}" ]] && declare -gx SYMBOL_WARNING="⚠️"
[[ -z "${SYMBOL_INFO}" ]] && declare -gx SYMBOL_INFO="ℹ️"
[[ -z "${SYMBOL_SUCCESS}" ]] && declare -gx SYMBOL_SUCCESS="✅"
# ==================================================================
# FUNCTIONS
# ==================================================================
#
# ANSI FG COLOR FUNCTIONS ------------------------------------------
#
ansi::color()				{ printf '%s38;5;%sm' "$ANSI_CSI" "$1"; }
ansi::color::reset()		{ printf '%s0m' "$ANSI_CSI"; }
ansi::black()				{ printf '%s30m' "$ANSI_CSI"; }
ansi::blue()				{ printf '%s34m' "$ANSI_CSI"; }
ansi::cyan()				{ printf '%s36m' "$ANSI_CSI"; }
ansi::green()				{ printf '%s32m' "$ANSI_CSI"; }
ansi::magenta()				{ printf '%s35m' "$ANSI_CSI"; }
ansi::red()					{ printf '%s31m' "$ANSI_CSI"; }
ansi::white()				{ printf '%s37m' "$ANSI_CSI"; }
ansi::yellow()				{ printf '%s33m' "$ANSI_CSI"; }

ansi::rgb()					{ printf '%s38;2;%s;%s;%sm' "$ANSI_CSI" "$1" "$2" "$3"; }
#
# ANSI HVY COLOR FUNCTIONS -----------------------------------------
#
ansi::hvy::black()			{ printf '%s90m' "$ANSI_CSI"; }
ansi::hvy::blue()			{ printf '%s94m' "$ANSI_CSI"; }
ansi::hvy::cyan()			{ printf '%s36m' "$ANSI_CSI"; }
ansi::hvy::green()			{ printf '%s92m' "$ANSI_CSI"; }
ansi::hvy::magenta()		{ printf '%s95m' "$ANSI_CSI"; }
ansi::hvy::red()			{ printf '%s91m' "$ANSI_CSI"; }
ansi::hvy::white()			{ printf '%s97m' "$ANSI_CSI"; }
ansi::hvy::yellow()			{ printf '%s93m' "$ANSI_CSI"; }
#
# ANSI BG COLOR FUNCTIONS ------------------------------------------
#
ansi::bg::reset()			{ printf '%s49m' "$ANSI_CSI"; }
ansi::bg::color()			{ printf '%s48;5;%sm' "$ANSI_CSI" "$1"; }
ansi::bg::rgb()				{ printf '%s48;2;%s;%s;%sm' "$ANSI_CSI" "$1" "$2" "$3"; }
ansi::bg::black()			{ printf '%s40m' "$ANSI_CSI"; }
ansi::bg::blue()			{ printf '%s44m' "$ANSI_CSI"; }
ansi::bg::cyan()			{ printf '%s46m' "$ANSI_CSI"; }
ansi::bg::green()			{ printf '%s42m' "$ANSI_CSI"; }
ansi::bg::magenta()			{ printf '%s45m' "$ANSI_CSI"; }
ansi::bg::red()				{ printf '%s41m' "$ANSI_CSI"; }
ansi::bg::white()			{ printf '%s47m' "$ANSI_CSI"; }
ansi::bg::yellow()			{ printf '%s43m' "$ANSI_CSI"; }
#
# ANSI HVY BG COLOR FUNCTIONS --------------------------------------
#
ansi::bg::hvy::black()		{ printf '%s100m' "$ANSI_CSI"; }
ansi::bg::hvy::blue()		{ printf '%s104m' "$ANSI_CSI"; }
ansi::bg::hvy::cyan()		{ printf '%s106m' "$ANSI_CSI"; }
ansi::bg::hvy::green()		{ printf '%s102m' "$ANSI_CSI"; }
ansi::bg::hvy::magenta()	{ printf '%s105m' "$ANSI_CSI"; }
ansi::bg::hvy::red()		{ printf '%s101m' "$ANSI_CSI"; }
ansi::bg::hvy::white()		{ printf '%s107m' "$ANSI_CSI"; }
ansi::bg::hvy::yellow()		{ printf '%s43m' "$ANSI_CSI"; }
#
# ANSI EFFECT FUNCTIONS --------------------------------------------
#
ansi::blink() 				{ printf '%s5m' "$ANSI_CSI"; }
ansi::blink::rapid()		{ printf '%s6m' "$ANSI_CSI"; }
ansi::bold()				{ printf '%s1m' "$ANSI_CSI"; }
ansi::faint()				{ printf '%s2m' "$ANSI_CSI"; }
ansi::inverse()				{ printf '%s7m' "$ANSI_CSI"; }
ansi::invisible()			{ printf '%s8m' "$ANSI_CSI"; }
ansi::italic()				{ printf '%s3m' "$ANSI_CSI"; }
ansi::normal()				{ printf '%s22m' "$ANSI_CSI"; }
ansi::no::blink()			{ printf '%s25m' "$ANSI_CSI"; }
ansi::no::border()			{ printf '%s54m' "$ANSI_CSI"; }
ansi::no::inverse()			{ printf '%s27m' "$ANSI_CSI"; }
ansi::no::overline()		{ printf '%s55m' "$ANSI_CSI"; }
ansi::no::strike()			{ printf '%s29m' "$ANSI_CSI"; }
ansi::no::underline()		{ printf '%s24m' "$ANSI_CSI"; }
ansi::overline()			{ printf '%s53m' "$ANSI_CSI"; }
ansi::plain()				{ printf '%s23m' "$ANSI_CSI"; }
ansi::strike()				{ printf '%s9m' "$ANSI_CSI"; }
ansi::underline()			{ printf '%s4m' "$ANSI_CSI"; }
ansi::underline::double()	{ printf '%s21m' "$ANSI_CSI"; }
ansi::visible()				{ printf '%s28m' "$ANSI_CSI"; }
#
# ANSI FORMAT FUNCTIONS --------------------------------------------
#
ansi::column()				{ printf '%s%sG' "$ANSI_CSI" "${1-}"; }
ansi::column::relative()	{ printf '%s%sa' "$ANSI_CSI" "${1-}"; }
ansi::delete::chars()		{ printf '%s%sP' "$ANSI_CSI" "${1-}"; }
ansi::delete::lines()		{ printf '%s%sM' "$ANSI_CSI" "${1-}"; }
ansi::encircle()			{ printf '%s52m' "$ANSI_CSI"; }
ansi::erase::display()		{ printf '%s%sJ' "$ANSI_CSI" "${1-}"; }
ansi::erase::chars()		{ printf '%s%sX' "$ANSI_CSI" "${1-}"; }
ansi::erase::line()			{ printf '%s%sK' "$ANSI_CSI" "${1-}"; }
ansi::font()				{ printf '%s1%sm' "$ANSI_CSI" "${1-0}"; }
ansi::font::reset()			{ printf '%s10m' "$ANSI_CSI"; }
ansi::fraktur()				{ printf '%s20m' "$ANSI_CSI"; }
ansi::frame()				{ printf '%s51m' "$ANSI_CSI"; }
ansi::insert::chars()		{ printf '%s%s@' "$ANSI_CSI" "${1-}"; }
ansi::insert::lines()		{ printf '%s%sL' "$ANSI_CSI" "${1-}"; }
ansi::line()				{ printf '%s%sd' "$ANSI_CSI" "${1-}"; }
ansi::line::relative()		{ printf '%s%se' "$ANSI_CSI" "${1-}"; }
ansi::repeat()				{ printf '%s%sb' "$ANSI_CSI" "${1-}"; }
ansi::icon()				{ printf '%s1;%s%s' "$ANSI_OSC" "${1-}" "$ANSI_ST"; }
ansi::title()				{ printf '%s2;%s%s' "$ANSI_OSC" "${1-}" "$ANSI_ST"; }
ansi::tab()					{ printf '%s%sI' "$ANSI_CSI" "${1-}"; }
ansi::tab::back()			{ printf '%s%sZ' "$ANSI_CSI" "${1-}"; }
#
# ANSI CURSOR FUNCTIONS --------------------------------------------
#
ansi::cursor::restore()		{ printf '%su' "$ANSI_CSI"; }
ansi::cursor::show()		{ printf '%s?25h' "$ANSI_CSI"; }
ansi::down()				{ printf '%s%sB' "$ANSI_CSI" "${1-}"; }
ansi::forward()				{ printf '%s%sC' "$ANSI_CSI" "${1-}"; }
ansi::hide::cursor()		{ printf '%s92m' "$ANSI_CSI"; }
ansi::line::next()			{ printf '%s%sE' "$ANSI_CSI" "${1-}"; }
ansi::line::prev()			{ printf '%s%sF' "$ANSI_CSI" "${1-}"; }
ansi::position()			{ local position="${1-}"; printf '%s%sH' "$ANSI_CSI" "${position/,/;}"; }
ansi::save::cursor()		{ printf '%ss' "$ANSI_CSI"; }
ansi::scroll::down()		{ printf '%s%sT' "$ANSI_CSI" "${1-}"; }
ansi::scroll::up()			{ printf '%s%sS' "$ANSI_CSI" "${1-}"; }
ansi::up()					{ printf '%s%sA' "$ANSI_CSI" "${1-}"; }
#
# ANSI LONG SHOTS --------------------------------------------------
#
ansi::bell()				{ printf "%s" $'\007'; }
ansi::ideogram::left()		{ printf '%s62m' "$ANSI_CSI"; }
ansi::ideogram::left::2() 	{ printf '%s62m' "$ANSI_CSI"; }
ansi::ideogram::reset()		{ printf '%s65m' "$ANSI_CSI"; }
ansi::ideogram::right()		{ printf '%s60m' "$ANSI_CSI"; }
ansi::ideogram::right::2()	{ printf '%s61m' "$ANSI_CSI"; }
ansi::ideogram::stress()	{ printf '%s64m' "$ANSI_CSI"; }
#
# ANSI REPORT FUNCTIONS --------------------------------------------
#
# ------------------------------------------------------------------
# ansi::report
# ------------------------------------------------------------------
# Report runner for reporting functions below
# ------------------------------------------------------------------
ansi::report()
{
	local buff c report

	report=""

	# NOTE: read bypass piping, which lets this work:
	# ansi --report-window-chars | cut -d, -f 1
	read -p "$ANSI_CSI$1" -r -N "${#2}" -s -t 1 buff

	if [ "$buff" != "$2" ]; then
		return 1
	fi

	read -r -N "${#3}" -s -t 1 buff

	while [[ "$buff" != "$3" ]]; do
		report="$report${buff:0:1}"
		read -r -N 1 -s -t 1 c || exit 1
		buff="${buff:1}$c"
	done

	ANSI_REPORT=$report
}
# ------------------------------------------------------------------
# ansi::reportPosition
# ------------------------------------------------------------------
# Report current cursor position (ROW,COL)
# ------------------------------------------------------------------
ansi::reportPosition()
{
	ansi::report 6n "$ANSI_CSI" R || return 1
	printf '%s\n' "${ANSI_REPORT//;/,}"
}
# ------------------------------------------------------------------
# ansi::reportIcon
# ------------------------------------------------------------------
ansi::reportIcon()
{
	ansi::report 20t "${ANSI_OSC}L" "$ANSI_ST" || return 1
	printf '%s\n' "${ANSI_REPORT//;/,}"
}
# ------------------------------------------------------------------
# ansi::reportScreenChars
# ------------------------------------------------------------------
# Report ROWS,COLS for the entire screen
# ------------------------------------------------------------------
ansi::reportScreenChars()
{
	ansi::report 19t "${ANSI_CSI}9;" t || return 1
	printf '%s\n' "${ANSI_REPORT//;/,}"
}
# ------------------------------------------------------------------
# ansi::reportTitle
# ------------------------------------------------------------------
ansi::reportTitle()
{
	ansi::report 21t "${ANSI_OSC}l" "$ANSI_ST" || return 1
	printf '%s\n' "${ANSI_REPORT//;/,}"
}
# ------------------------------------------------------------------
# ansi::reportWindowChars
# ------------------------------------------------------------------
# Report ROWS,COLS for the current window
# ------------------------------------------------------------------
ansi::reportWindowChars()
{
	ansi::report 18t "${ANSI_CSI}8;" t || return 1
	printf '%s\n' "${ANSI_REPORT//;/,}"
}
# ------------------------------------------------------------------
# ansi::reportWindowPixels
# ------------------------------------------------------------------
# Report HEIGHT,WIDTH in pixels for the current window
# ------------------------------------------------------------------
ansi::reportWindowPixels()
{
	ansi::report 14t "${ANSI_CSI}4;" t || return 1
	printf '%s\n' "${ANSI_REPORT//;/,}"
}
# ------------------------------------------------------------------
# ansi::reportWindowPosition
# ------------------------------------------------------------------
# Report X,Y in pixels for current window position
# ------------------------------------------------------------------
ansi::reportWindowPosition()
{
	ansi::report 13t "${ANSI_CSI}3;" t || return 1
	printf '%s\n' "${ANSI_REPORT//;/,}"
}
# ------------------------------------------------------------------
# ansi::reportWindowState
# ------------------------------------------------------------------
# Report current window state as either "open" or "iconified"
# ------------------------------------------------------------------
ansi::reportWindowState()
{
	ansi::report 11t "$ANSI_CSI" t || return 1
	case "$ANSI_REPORT" in
		1)
			printf 'open\n'
			;;
		2)
			printf 'iconified\n'
			;;
		*)
			printf 'unknown (%s)\n' "$ANSI_REPORT"
			;;
	esac
}
#
# ANSI MISC FUNCTIONS ----------------------------------------------
#
ansi::reset::attributes()	{ printf '%s22;23;24;25;27;28;29;54;55m' "$ANSI_CSI"; }
ansi::reset::fg()			{ printf '%s39m' "$ANSI_CSI"; }
#
# ANSI CORE FUNCTIONS ----------------------------------------------
#
# ------------------------------------------------------------------
# ansi::supported
# ------------------------------------------------------------------
# Detect whether or not ANSI is supported in the current environment
# ------------------------------------------------------------------
ansi::supported()
{
	# Optionally override detection logic
	# to support post processors that interpret color codes AFTER output is generated.
	# Use environment variable "ANSI_FORCE_SUPPORT=true" to enable the override.
	if [[ -n "${ANSI_FORCE_SUPPORT-}" ]]; then
		return 0
	fi

	if hash tput &> /dev/null; then
		if [[ "$(tput colors)" -lt 8 ]]; then
			return 1
		fi
		return 0
	fi

	# Query the console and see if we get ANSI codes back.
	# CSI 0 c == CSI c == Primary Device Attributes.
	# Idea:	CSI c
	# Response = CSI ? 6 [234] ; 2 2 c
	# The "22" means ANSI color, but terminals don't need to send that back.
	# If we get anything back, let's assume it works.
	ansi::report c "$ANSI_CSI?" c || return 1
	[[ -n "$ANSI_REPORT" ]]
}
# ------------------------------------------------------------------
# ansi::reset
# ------------------------------------------------------------------
# Reset all escape codes
# ------------------------------------------------------------------
ansi::reset()
{
	ansi::color::reset
	ansi::font::reset
	ansi::erase::display 2
	ansi::position "1;1"
	ansi::cursor::show
}
#
# COLOR ALIASES ----------------------------------------------------
#
declare -gx BLACK="$(ansi::black)"
declare -gx BLUE="$(ansi::hvy::blue)"
declare -gx CYAN="$(ansi::cyan)"
declare -gx GOLD="$(ansi::yellow)"
declare -gx GREEN="$(ansi::green)"
declare -gx MAGENTA="$(ansi::hvy::magenta)"
declare -gx PURPLE="$(ansi::magenta)"
declare -gx PINK="$(ansi::hvy::red)"
declare -gx RED="$(ansi::red)"
declare -gx GREY="$(ansi::white)"
declare -gx WHITE="$(ansi::hvy::white)"
declare -gx YELLOW="$(ansi::hvy::yellow)"
# RESETS
declare -gx RESET="$(ansi::color::reset)"
declare -gx RESETALL="$(ansi::reset)"
#
# BG ALIASES -------------------------------------------------------
#
declare -gx BG_BLACK="$(ansi::bg::black)"
declare -gx BG_BLUE="$(ansi::bg::hvy::blue)"
declare -gx BG_CYAN="$(ansi::bg::cyan)"
declare -gx BG_GOLD="$(ansi::bg::yellow)"
declare -gx BG_GREEN="$(ansi::bg::green)"
declare -gx BG_MAGENTA="$(ansi::bg::hvy::magenta)"
declare -gx BG_PURPLE="$(ansi::bg::magenta)"
declare -gx BG_PINK="$(ansi::bg::hvy::red)"
declare -gx BG_RED="$(ansi::bg::red)"
declare -gx BG_GREY="$(ansi::bg::white)"
declare -gx BG_WHITE="$(ansi::bg::hvy::white)"
declare -gx BG_YELLOW="$(ansi::bg::hvy::yellow)"
# BG RESET
declare -gx BG_RESET="$(ansi::bg::reset)"
#
# FORMAT ALIASES ---------------------------------------------------
#
declare -gx BLINK="$(ansi::blink)"
declare -gx BLINKFAST="$(ansi::blink::rapid)"
declare -gx NOBLINK="$(ansi::no::blink)"
declare -gx BOLD="$(ansi::bold)"
declare -gx DOUBLELINE="$(ansi::underline::double)"
declare -gx FAINT="$(ansi::faint)"
declare -gx INVERSE="$(ansi::inverse)"
declare -gx NOINVERSE="$(ansi::no::inverse)"
declare -gx INVISIBLE="$(ansi::invisible)"
declare -gx ITALIC="$(ansi::italic)"
declare -gx NORMAL="$(ansi::normal)"
declare -gx OVERLINE="$(ansi::overline)"
declare -gx NOOVERLINE="$(ansi::no::overline)"
declare -gx OVERUNDER="$(ansi::overline)$(ansi::underline)"
declare -gx NOOVERUNDER="$(ansi::no::overline)$(ansi::no::underline)"
declare -gx PLAIN="$(ansi::plain)"
declare -gx STRIKE="$(ansi::strike)"
declare -gx NOSTRIKE="$(ansi::no::strike)"
declare -gx UNDERLINE="$(ansi::underline)"
declare -gx NOUNDERLINE="$(ansi::no::underline)"
declare -gx VISIBLE="$(ansi::visible)"
#
# PRINTABLE ALIASES ------------------------------------------------
#
declare -gx DEFAULT_Y="[${WHITE}Y${_0}/n]"
declare -gx DEFAULT_N="[y/${WHITE}N${_0}]"
#
# ALIASED FUNCTIONS ------------------------------------------------
#
# ------------------------------------------------------------------
# echoAlias
# ------------------------------------------------------------------
# @description Master alias function for `echo` command
#
# @arg $1           [string]    String to be rendered
# @arg -c='string'  [option]    Color alias as defined above 				(required)
# @arg -p='string'  [option]    String to prefix to $1 						(optional)
# @arg -s='string'  [option]    String to suffix to $1 						(optional)
# @arg -e           [option]    Enable escape codes 						(optional)
# @arg -n           [option]    Disable newline at end of rendered string 	(optional)
#
# @exitcode 0 - Success (true)
# @exitcode 1 - Failure (false)
# @exitcode 2 - ERROR - Missing Argument
# @exitcode 3 - ERROR - Invalid Argument
# ------------------------------------------------------------------
echoAlias()
{
	local msg="${1:-}"
	local COLOR OUTPUT
	local PREFIX=""
	local SUFFIX=""
	local STREAM="1"

	local OUTARGS=()

	[[ -z "$msg" ]] && { echo "${RED}ERROR :: echoAlias :: Requires Argument!${RESET}"; return 1; }

	shift

    while getopts ":ec:p:s:En" char
    do
        case "$char" in
            e)
                STREAM=2
                ;;
            c)
                COLOR="${OPTARG}"
                ;;
            p)
                PREFIX="${OPTARG}"
                ;;
            s)
                SUFFIX="${OPTARG}"
                ;;
            E)
                OUTARGS+=("-e")
                ;;
            n)
                OUTARGS+=("-n")
                ;;
            :)
                echo "${RED}ERROR: -${OPTARG} Requires an Argument!${RESET}"
                return 2
                ;;
            *)
                echo "${RED}ERROR: Invalid Argument!${RESET}"
                return 3
                ;;
        esac
    done

	OUTPUT="${COLOR}${PREFIX}$msg${SUFFIX}${RESET}"

	[[ "$STREAM" -eq 2 ]] && echo "${OUTARGS[@]}" "$OUTPUT" >&2 || echo "${OUTARGS[@]}" "$OUTPUT"

	return 0
}
#
# ECHO COLOR ALIASES
#
echoBlack() { echoAlias "$1" -c="${BLACK}" "${@:2}"; }
echoPink() { echoAlias "$1" -c="${PINK}" "${@:2}"; }
echoRed() { echoAlias "$1" -c="${RED}" "${@:2}"; }
echoGreen() { echoAlias "$1" -c="${GREEN}" "${@:2}"; }
echoGold() { echoAlias "$1" -c="${GOLD}" "${@:2}"; }
echoYellow() { echoAlias "$1" -c="${YELLOW}" "${@:2}"; }
echoBlue() { echoAlias "$1" -c="${BLUE}" "${@:2}"; }
echoMagenta() { echoAlias "$1" -c="${MAGENTA}" "${@:2}"; }
echoPurple() { echoAlias "$1" -c="${PURPLE}" "${@:2}"; }
echoCyan() { echoAlias "$1" -c="${CYAN}" "${@:2}"; }
echoGrey() { echoAlias "$1" -c="${GREY}" "${@:2}"; }
echoWhite() { echoAlias "$1" -c="${WHITE}" "${@:2}"; }
#
# ECHO STYLE ALIASES
#
echoDebug() { echoAlias "${ITALIC}$1${NORMAL}" -c="${WHITE}" "${@:2}"; }
echoDefault() { echoAlias "${RESET}$1" "${@:2}"; }
#
# MESSAGE ALIASES
#
echoError() { echoAlias "${SYMBOL_ERROR} $1" -c="${RED}" --err "${@:2}"; }
echoInfo() { echoAlias "${SYMBOL_INFO} $1" -c="${BLUE}" "${@:2}"; }
echoSuccess() { echoAlias "${SYMBOL_SUCCESS} $1" -c="${GREEN}" "${@:2}"; }
echoWarning() { echoAlias "${SYMBOL_WARNING} $1" -c="${GOLD}" "${@:2}"; }
#
# ERROR ALIASES
#
# ------------------------------------------------------------------
# errorExit
# ------------------------------------------------------------------
# @description Write message to stdout using error styling and exit
# with specified code
#
# @arg $1 - string - Message to display
# @arg $2 - string - Exit Code
#
# @stdout As defined by $1
#
# @exitcode As defined by $2
# ------------------------------------------------------------------
errorExit()
{
	local msg code

	msg="ERROR:"
	[[ -n ${FUNCNAME[1]} ]] && msg="$msg ${FUNCNAME[1]} ::"
	[[ -n "$1" ]] && msg="$msg $1"

	if [[ -n "$2" ]]; then
		code="$2"
	else
		[[ $? -eq 0 ]] && code=1 || code="$?"
	fi

	echoError "$msg"; exit "$code";
}
# ------------------------------------------------------------------
# errorReturn
# ------------------------------------------------------------------
# @description Write message to screen using error styling and return
# the specified exitcode
#
# @arg $1 - string - Message to display
# @arg $2 - string - Exit Code
#
# @stdout As defined by $1
#
# @exitcode As defined by $2
# ------------------------------------------------------------------
errorReturn()
{
	local msg code

	msg="ERROR:"
	[[ -n ${FUNCNAME[1]} ]] && msg="$msg ${FUNCNAME[1]} ::"
	[[ -n "$1" ]] && msg="$msg $1"

	if [[ -n "$2" ]]; then
		code="$2"
	else
		[[ $? -eq 0 ]] && code=1 || code="$?"
	fi

	echoError "$msg"; return "$code";
}
#
# FORMAT FUNCTIONS ------------------------------------------------
#
# ------------------------------------------------------------------
# echoIndent
# ------------------------------------------------------------------
# @description Indent text in $1 by the number of spaces in $2 using
# the char in $3
#
# @arg $1 - string - The text to indent
# @arg $2 - integer - Number of spaces to indent
# @arg $3 - string - Character(s) to display after spaces and before text
#
# @stdout Indented Text
# ------------------------------------------------------------------
echoIndent()
{
	local ind="${2:-0}"
	local chr="${3:'- '}"
	local tab=""
	local c=1

	if [[ -n "$ind" ]] && [[ "$ind" =~ ^[1-9]$ ]]; then
		while [ "$c" -le "$ind" ]
		do
			tab+="\t"
			((c++))
		done
	fi

    echo -e "${tab}${chr}${1}"
}
#
# HELPER FUNCTIONS -------------------------------------------------
#
# ------------------------------------------------------------------
# ansi::test::aliases
# ------------------------------------------------------------------
# @description Test BB-ANSI aliases and display and example of each alias
# ------------------------------------------------------------------
ansi::test::aliases()
{
	clear
	echoGold "=================================================================="
	echoGold "COLOR TEST"
	echoGold "=================================================================="
	echo
	echoBlack "echoBlack"
	echoPink "echoPink"
	echoRed "echoRed"
	echoGreen "echoGreen"
	echoGold "echoGold"
	echoYellow "echoYellow"
	echoBlue "echoBlue"
	echoMagenta "echoMagenta"
	echoPurple "echoPurple"
	echoCyan "echoCyan"
	echoGrey "echoGrey"
	echoWhite "echoWhite"
	echoDebug "echoDebug"
	echoDefault "echoDefault"
	echoError "echoError"
	echoInfo "echoInfo"
	echoSuccess "echoSuccess"
	echoWarning "echoWarning"
	echo
	echoGold "=================================================================="
	echoGold "BACKGROUND TEST"
	echoGold "=================================================================="
	echo
	echo "${BG_BLACK}  ${WHITE}BG BLACK  ${RESET}${BG_RESET}"
	echo "${BG_PINK}  ${BLACK}BG PINK  ${RESET}${BG_RESET}"
	echo "${BG_RED}  ${BLACK}BG RED  ${RESET}${BG_RESET}"
	echo "${BG_GREEN}  ${BLACK}BG GREEN  ${RESET}${BG_RESET}"
	echo "${BG_GOLD}  ${BLACK}BG GOLD  ${RESET}${BG_RESET}"
	echo "${BG_YELLOW}  ${BLACK}BG YELLOW  ${RESET}${BG_RESET}"
	echo "${BG_MAGENTA}  ${BLACK}BG MAGENTA  ${RESET}${BG_RESET}"
	echo "${BG_PURPLE}  ${BLACK}BG PURPLE  ${RESET}${BG_RESET}"
	echo "${BG_CYAN}  ${BLACK}BG CYAN  ${RESET}${BG_RESET}"
	echo "${BG_GREY}  ${BLACK}BG GREY  ${RESET}${BG_RESET}"
	echo "${BG_WHITE}  ${BLACK}BG WHITE  ${RESET}${BG_RESET}"
	echo
	echoGold "=================================================================="
	echoGold "STYLE TEST"
	echoGold "=================================================================="
	echo
	echo "${BLINK}BLINK${NOBLINK}"
	echo "${BLINKFAST}BLINKFAST${NOBLINK}"
	echo "${BOLD}BOLD${NORMAL}"
	echo "${DOUBLELINE}DOUBLELINE${NOUNDERLINE}"
	echo "${FAINT}FAINT${NORMAL}"
	echo "${INVERSE}  INVERSE  ${NOINVERSE}"
	echo "${INVISIBLE}INVISIBLE${VISIBLE}"
	echo "${ITALIC}ITALIC${PLAIN}"
	echo "${OVERLINE}OVERLINE${NOOVERLINE}"
	echo "${OVERUNDER}OVERUNDER${NOOVERUNDER}"
	echo "${STRIKE}STRIKE${NOSTRIKE}"
	echo "${UNDERLINE}UNDERLINE${NOUNDERLINE}"
	echo
}
# ------------------------------------------------------------------
# ansi::version
# ------------------------------------------------------------------
# @description Reports the version and build date of this release
#
# @noargs
#
# @stdout Version, Copyright, & Build Information
# ------------------------------------------------------------------
ansi::version()
{
	local verbosity="${1:-}"

	if [[ -z "$verbosity" ]]; then
		echo "${ANSI_VERSION}"
	else
		echo
		echo "Bash-Bits Modular Bash Library"
		echoWhite "BB-ANSI Module ${ANSI_VERSION}"
		echo "Copyright © 2022-2023 Darren (Ragdata) Poulton"
		echo "Build: ${ANSI_BUILD}"
		echo "Build Date: ${ANSI_BUILD_DATE}"
		echo
	fi
}
# ==================================================================
# MAIN
# ==================================================================
if [[ ! $(is::sourced) ]]; then
	trap 'bb::errorHandler "LINENO" "BASH_LINENO" "${BASH_COMMAND}" "${?}"' ERR
	options=$(getopt -l "version::" -o "v::" -a -- "$@")

	eval set --"$options"

	while true
	do
		case "$1" in
			-v|--version)
				if [[ -n "${2}" ]]; then
					ansi::version "${2}"
					shift 2
				else
					ansi::version
					shift
				fi
				exitReturn 0
				;;
			--)
				shift
				break
				;;
			*)
				echoError "Invalid Argument!"
				exitReturn 2
				;;
		esac
	done
fi
