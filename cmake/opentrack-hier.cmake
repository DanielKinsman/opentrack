# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
# AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
# DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
# PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

set(opentrack-install-rpath "")
if(APPLE)
    set(opentrack-hier-pfx ".")
    set(opentrack-hier-path "/")                        # MUST HAVE A TRAILING BACKSLASH
    set(opentrack-hier-doc "/")                         # MUST HAVE A TRAILING BACKSLASH
    set(opentrack-hier-str RUNTIME DESTINATION . LIBRARY DESTINATION .)
    set(opentrack-doc-pfx "./doc")
    set(opentrack-doc-src-pfx "./source-code")
    set(opentrack-i18n-pfx "./i18n")
    set(opentrack-i18n-path "./i18n")
elseif(WIN32)
    set(opentrack-hier-pfx "./modules")
    set(opentrack-hier-path "/modules/")                # MUST HAVE A TRAILING BACKSLASH
    set(opentrack-hier-doc "/doc/")                     # MUST HAVE A TRAILING BACKSLASH
    set(opentrack-doc-pfx "./doc")
    set(opentrack-doc-src-pfx "./source-code")
    set(opentrack-hier-str RUNTIME DESTINATION ./modules/ LIBRARY DESTINATION ./modules/)
    set(opentrack-i18n-pfx "./i18n")
    set(opentrack-i18n-path "./i18n")
    set(opentrack-hier-debug "./debug")
else()
    set(opentrack-hier-pfx "lib/opentrack")
    set(opentrack-hier-path "/../lib/opentrack/")   # MUST HAVE A TRAILING BACKSLASH
    set(opentrack-hier-doc "/share/doc/opentrack/")     # MUST HAVE A TRAILING BACKSLASH
    set(opentrack-doc-pfx "./share/doc/opentrack")
    set(opentrack-doc-src-pfx "./share/doc/opentrack/source-code")
    set(opentrack-install-rpath "${CMAKE_INSTALL_PREFIX}/${opentrack-hier-pfx}")
    set(opentrack-hier-str ARCHIVE DESTINATION share/opentrack LIBRARY DESTINATION ${opentrack-hier-pfx} RUNTIME DESTINATION bin)
    set(opentrack-i18n-pfx "./share/opentrack/i18n")
    set(opentrack-i18n-path "../share/opentrack/i18n")
endif()

function(otr_escape_string var str)
    string(REGEX REPLACE "([\$\\\"#])" "\\\\\\1" tmp__ "${str}")
        set(${var} "${tmp__}" PARENT_SCOPE)
endfunction()

function(otr_setup_refresh_install_dir)
    if((NOT CMAKE_INSTALL_PREFIX STREQUAL "") AND (NOT opentrack-doc-src-pfx STREQUAL ""))
        otr_escape_string(dir "${CMAKE_INSTALL_PREFIX}/${opentrack-doc-src-pfx}/")
        install(CODE "file(REMOVE_RECURSE \"${dir}\")")
    endif()
endfunction()

set(opentrack-contrib-pfx "${opentrack-doc-pfx}/contrib")

set(opentrack-binary-suffix "")
if(APPLE)
    set(opentrack-binary-suffix ".bin")
elseif(WIN32)
    set(opentrack-binary-suffix ".exe")
endif()
