/* Copyright 2021 @ Keychron (https://www.keychron.comaaa)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include QMK_KEYBOARD_H
/* #define MATRIX_ROWS 5*/
// clang-format off

#include "quantum.h"
#include "action_layer.h"

#define KC_TASK LGUI(KC_TAB)
#define KC_FLXP LGUI(KC_E)

#define LOWER MO(_LOWER)
#define RAISE MO(_RAISE)

// alt gr
#undef G
#define G(kc) RALT(kc)

// custom keycodes

// NB! I use Norwegian keyboard layout on my machines, so the keymap probably
//doesn't make much sense for US/ANSI users

#define F_FSLH S(KC_7) // forward slash
#define F_BSLH KC_EQL // backward slash
#define F_EQL S(KC_0) // equals sign
#define F_APOS KC_BSLS // '
#define F_TIMES S(KC_RBRC) // *
#define F_PLUS KC_RBRC // +
#define F_QUEST S(KC_MINS) // ?
//#define F_HAT S(KC_RBRC) // ^
#define F_TILD G(KC_RBRC) // ~
#define F_UML KC_RBRC // ¨ (umlaut)
#define F_PRCT S(KC_5) // %
#define F_SECT S(KC_GRV) // section sign ("law sign") (shifted key below esc)
#define F_GRAVE S(KC_EQL)
#define F_ACUTE G(KC_EQL)

#define KC_AA KC_LBRC
#define KC_OE KC_SCLN
#define KC_AE KC_QUOT

// brackets
#define F_SBRL G(KC_8) // square bracket left
#define F_SBRR G(KC_9) // square bracket right
#define F_CBRL G(KC_7) // curly bracket left
#define F_CBRR G(KC_0) // curly bracket right
#define F_RBRL S(KC_8) // round bracket left
#define F_RBRR S(KC_9) // round bracket right
#define F_ABRL KC_NUBS // angle bracket left
#define F_ABRR S(KC_NUBS) // angle bracket right


enum custom_keycodes{
  TD_WH_D,
  TD_FN2_F,
  TD_LALT,
  TD_MUTE
};

tap_dance_action_t tap_dance_actions[] = {
  //Tap once for Esc, twice for Caps Lock
  [TD_WH_D]  = ACTION_TAP_DANCE_DOUBLE(KC_WH_D, KC_F11),
  [TD_FN2_F] = ACTION_TAP_DANCE_DOUBLE(_______, KC_F12),
  [TD_LALT]  = ACTION_TAP_DANCE_DOUBLE(KC_LALT, KC_CAPS),
  [TD_MUTE]  = ACTION_TAP_DANCE_DOUBLE(KC_MUTE, KC_MEDIA_SELECT)
// Other declarations would go here, separated by commas, if you have them
};

// layers
enum layers{
    LINUX_BASE,
    FN_1,
    WIN_BASE,
    WIN_FN,
    FN_2
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [LINUX_BASE] = LAYOUT_ansi_82(
        KC_ESC,     KC_F1,      KC_F2,      KC_F3,    KC_F4,       KC_F5,    KC_F6,        KC_F7,    KC_F8,      KC_F9,         KC_F10,    KC_F11,     KC_F12,   KC_DEL,            TD(TD_MUTE),
        KC_GRV,     KC_1,       KC_2,       KC_3,     KC_4,        KC_5,     KC_6,         KC_7,     KC_8,       KC_9,          KC_0,      KC_MINS,    KC_EQL,   KC_BSPC, KC_MNXT,
        KC_TAB,     KC_DOT,     KC_COMMA,   KC_SCLN,  KC_P,        KC_Y,     KC_F,         KC_G,     KC_C,       KC_H,          KC_L,      KC_BSPC,    KC_RBRC,  KC_BSLS,           KC_MPLY,
        TD(TD_LALT),KC_A,       KC_O,       KC_E,     KC_U,        KC_I,     KC_D,         KC_R,     KC_T,       KC_N,          KC_S,      KC_ENT,               KC_QUOT,           KC_MPRV,
        KC_LSFT,                KC_SLSH,    KC_Q,     KC_J,        KC_K,     KC_X,         KC_B,     KC_M,       KC_W,          KC_V,      KC_Z,                 KC_RSFT, KC_UP,
        KC_LCTL,    KC_LCMD,    MO(FN_2),                                    KC_SPC,                                        MO(FN_1),  KC_RALT,   KC_RCTL,   KC_LEFT, KC_DOWN,  KC_RGHT),

    [FN_1] = LAYOUT_ansi_82(
        _______,    KC_BRID,    KC_BRIU,    KC_TASK,  KC_FLXP,     RGB_VAD,  RGB_VAI,      KC_MPRV,  KC_MPLY,    KC_MNXT,       KC_MUTE,   KC_VOLD,   KC_VOLU,  KC_PSCR,            RGB_TOG,
        G(KC_GRV),  G(KC_1),    G(KC_2),    G(KC_3),  G(KC_4),     G(KC_5),  G(KC_6),      G(KC_7),  G(KC_8),    G(KC_9),       G(KC_0),   _______,   _______,  _______,  _______,
        _______,    KC_SLSH,    F_RBRL,     F_RBRR,   F_PLUS,      F_TIMES,  _______,      KC_HOME,  KC_PAGE_UP, KC_PAGE_DOWN,  KC_END,    KC_DEL,    _______,  _______,            _______,
        _______,    F_CBRL,     F_SBRL,     F_SBRR,   F_CBRR,      F_FSLH,   F_EQL,        KC_LEFT,  KC_DOWN,    KC_UP,         KC_RIGHT,  KC_APP,              _______,            _______,
        _______,                _______,    _______,  _______,     F_PRCT,   _______,      _______,  _______,    F_ABRL,        F_ABRR,    _______,             _______,  _______,
        _______,    _______,    _______,                                     _______,                                       _______,   _______,   _______,  _______,  _______,  _______),

    [FN_2] = LAYOUT_ansi_82(
        _______,    KC_BRID,    KC_BRIU,    KC_TASK,  KC_FLXP,     RGB_VAD,  RGB_VAI,      KC_MPRV,  KC_MPLY,    KC_MNXT,       KC_MUTE,   KC_VOLD,   KC_VOLU,  _______,            _______,
        _______,    A(KC_1),    A(KC_2),    A(KC_3),  A(KC_4),     A(KC_5),  A(KC_6),      A(KC_7),  A(KC_8),    A(KC_9),       A(KC_0),   _______,   _______,  _______,  _______,
         KC_F12,    _______,    _______,    _______,  _______,     _______,  TD(TD_FN2_F), KC_WH_L,  TD(TD_WH_D),KC_WH_U,       KC_WH_R,   KC_BTN2,   _______,  _______,            _______,
        _______,    _______,    _______,    _______,  _______,     _______,  KC_BTN3,      KC_MS_L,  KC_MS_D,    KC_MS_U,       KC_MS_R,   KC_BTN1,             _______,            _______,
        _______,                _______,    _______,  _______,     _______,  _______,      _______,  KC_ACL0,    KC_ACL1,       KC_ACL2,   _______,             _______,  _______,
        _______,    _______,    _______,                           _______,                                                 _______,   _______,   _______,  _______,  _______,  _______),

    [WIN_BASE] = LAYOUT_ansi_82(
        KC_ESC,     KC_F1,      KC_F2,    KC_F3,    KC_F4,    KC_F5,    KC_F6,    KC_F7,    KC_F8,    KC_F9,    KC_F10,   KC_F11,     KC_F12,   KC_DEL,             KC_MUTE,
        KC_GRV,     KC_1,       KC_2,     KC_3,     KC_4,     KC_5,     KC_6,     KC_7,     KC_8,     KC_9,     KC_0,     KC_MINS,    KC_EQL,   KC_BSPC,            KC_PGUP,
        KC_TAB,     KC_Q,       KC_W,     KC_E,     KC_R,     KC_T,     KC_Y,     KC_U,     KC_I,     KC_O,     KC_P,     KC_LBRC,    KC_RBRC,  KC_BSLS,            KC_HOME,
        KC_CAPS,    KC_A,       KC_S,     KC_D,     KC_F,     KC_G,     KC_H,     KC_J,     KC_K,     KC_L,     KC_SCLN,  KC_QUOT,              KC_ENT,             KC_PGDN,
        KC_LSFT,                KC_Z,     KC_X,     KC_C,     KC_V,     KC_B,     KC_N,     KC_M,     KC_COMM,  KC_DOT,   KC_SLSH,              KC_RSFT,  KC_UP,
        KC_LCTL,    KC_LCMD,    KC_LALT,                                KC_SPC,                                 KC_RALT,  MO(WIN_FN), KC_RCTL,  KC_LEFT,  KC_DOWN,  KC_RGHT),

    [WIN_FN] = LAYOUT_ansi_82(
        _______,  KC_BRID,  KC_BRIU,  KC_TASK,  KC_FLXP,  RGB_VAD,  RGB_VAI,  KC_MPRV,  KC_MPLY,  KC_MNXT,  KC_MUTE,  KC_VOLD,    KC_VOLU,  _______,            _______,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,
        RGB_TOG,  RGB_MOD,  RGB_VAI,  RGB_HUI,  RGB_SAI,  RGB_SPI,  _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,
        _______,  RGB_RMOD, RGB_VAD,  RGB_HUD,  RGB_SAD,  RGB_SPD,  _______,  _______,  _______,  _______,  _______,  _______,              _______,            _______,
        _______,            _______,  _______,  _______,  _______,  _______,  NK_TOGG,  _______,  _______,  _______,  _______,              _______,  _______,
        _______,  _______,  _______,                                _______,                                _______,  _______,    _______,  _______,  _______,  _______),

    /*[VOID] = LAYOUT_ansi_82(*/
        /*_______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,*/
        /*_______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,*/
        /*_______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,*/
        /*_______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,              _______,            _______,*/
        /*_______,            _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,              _______,  _______,*/
        /*_______,  _______,  _______,                                _______,                                _______,  _______,    _______,  _______,  _______,  _______),*/
};


#if defined(ENCODER_MAP_ENABLE)
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {
    [LINUX_BASE] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
    [FN_1]   = { ENCODER_CCW_CW(RGB_VAD, RGB_VAI)},
    [FN_2]   = { ENCODER_CCW_CW(RGB_MOD, RGB_RMOD)},
    [WIN_BASE] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
    [WIN_FN]   = { ENCODER_CCW_CW(RGB_VAD, RGB_VAI)}
};
#endif // ENCODER_MAP_ENABLE

