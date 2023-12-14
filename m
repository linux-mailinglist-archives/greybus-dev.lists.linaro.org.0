Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BD324818CC1
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 17:47:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C52E240B44
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 16:47:44 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	by lists.linaro.org (Postfix) with ESMTPS id E5FCE3F019
	for <greybus-dev@lists.linaro.org>; Thu, 14 Dec 2023 17:39:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of francesco@dolcini.it designates 217.194.8.81 as permitted sender) smtp.mailfrom=francesco@dolcini.it;
	dmarc=none
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BD29721454;
	Thu, 14 Dec 2023 18:39:45 +0100 (CET)
Date: Thu, 14 Dec 2023 18:39:44 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Message-ID: <ZXs94Mf1eOMCmGpT@francesco-nb.int.toradex.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214170146.641783-1-francesco@dolcini.it>
X-Rspamd-Queue-Id: E5FCE3F019
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.80 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:217.194.8.64/26:c];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:12637, ipnet:217.194.0.0/20, country:IT];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[dolcini.it,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,kernel.org,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org];
	R_DKIM_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DMARC_NA(0.00)[dolcini.it];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: francesco@dolcini.it
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FGFFHWJKDPN3CMO3QB7EUBYPWGJN227N
X-Message-ID-Hash: FGFFHWJKDPN3CMO3QB7EUBYPWGJN227N
X-Mailman-Approved-At: Tue, 19 Dec 2023 16:47:36 +0000
CC: Francesco Dolcini <francesco@dolcini.it>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob H
 erring <robh@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FGFFHWJKDPN3CMO3QB7EUBYPWGJN227N/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 14, 2023 at 06:01:46PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> receive_buf() is called from ttyport_receive_buf() that expects values
> ">= 0" from serdev_controller_receive_buf(), change its return type from
> ssize_t to size_t.
> 
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@kernel.org/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> hello,
> patch is based on current linux next.
> 
> It has an obvious problem, it touches files from multiple subsystem in a single
> patch that is complicated to review and eventually merge, just splitting this
> would however not work, it will break bisectability and the build.
> 
> I am looking for advise on the best way to move forward.
> 
> I see the following options:
>  - keep it as it is
>  - break it down with a patch with each subsystem, and squash before applying
>    from a single (tty?) subsystem
>  - go for a multi stage approach, defining a new callback, move to it and in
>    the end remove the original one, likewise it was done for i2c lately

whoops. I just noticed Greg applied commit 475fc6e2de6f ("tty: serdev:
convert to u8 and size_t") that touch the exact same files without much
of an issue.

Probably the "keep it as it is" is just the way to go.

> 
> ---
>  drivers/bluetooth/btmtkuart.c              |  4 ++--
>  drivers/bluetooth/btnxpuart.c              |  4 ++--
>  drivers/bluetooth/hci_serdev.c             |  4 ++--
>  drivers/gnss/core.c                        |  6 +++---
>  drivers/gnss/serial.c                      |  4 ++--
>  drivers/gnss/sirf.c                        |  6 +++---
>  drivers/greybus/gb-beagleplay.c            |  6 +++---
>  drivers/iio/chemical/pms7003.c             |  4 ++--
>  drivers/iio/chemical/scd30_serial.c        |  4 ++--
>  drivers/iio/chemical/sps30_serial.c        |  4 ++--
>  drivers/iio/imu/bno055/bno055_ser_core.c   |  4 ++--
>  drivers/mfd/rave-sp.c                      |  4 ++--
>  drivers/net/ethernet/qualcomm/qca_uart.c   |  2 +-
>  drivers/nfc/pn533/uart.c                   |  4 ++--
>  drivers/nfc/s3fwrn5/uart.c                 |  4 ++--
>  drivers/platform/chrome/cros_ec_uart.c     |  4 ++--
>  drivers/platform/surface/aggregator/core.c |  4 ++--
>  drivers/tty/serdev/serdev-ttyport.c        | 10 ++++------
>  include/linux/gnss.h                       |  4 ++--
>  include/linux/serdev.h                     |  8 ++++----
>  sound/drivers/serial-generic.c             |  4 ++--
>  21 files changed, 48 insertions(+), 50 deletions(-)
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
