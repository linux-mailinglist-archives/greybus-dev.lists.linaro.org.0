Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D76E583B0D7
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Jan 2024 19:19:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 847D743CBC
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Jan 2024 18:19:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 0879D3EFCF
	for <greybus-dev@lists.linaro.org>; Wed, 24 Jan 2024 18:18:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=RZiH9wTh;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CA9E61E92;
	Wed, 24 Jan 2024 18:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2D5C433C7;
	Wed, 24 Jan 2024 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706120334;
	bh=DL/EQqcJCQTk9UAclAYOtLINf9xZa1C9Zef6JseuhSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZiH9wThtrZRAy5vV1Ct2uyELIURtWXK8fmQT/2Pz+TJephG7gDlaFcKPIoidKbOh
	 gbGFb3T3yNFSsTfnTLTOotgkxbd7uLnw9S9WuMD3YiZDqBRoEPgpUqZM1H2gx4QWWt
	 0nF6bVM7nmeusnnZkvpUM46WZ1v+DMPR5CDVdVxU=
Date: Wed, 24 Jan 2024 10:18:53 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <2024012442-retool-surgical-d828@gregkh>
References: <20240109090715.982332-1-arnd@kernel.org>
 <20240109090715.982332-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109090715.982332-2-arnd@kernel.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0879D3EFCF
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ucw.cz,kernel.org,lunn.ch,arndb.de,gmail.com,redhat.com,traphandler.com,vger.kernel.org,linux.intel.com,kemnade.info,lists.linaro.org,lists.linux.dev];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
Message-ID-Hash: L6G3FGWSPHV55ULK4S3UGMIQWPPKI7BM
X-Message-ID-Hash: L6G3FGWSPHV55ULK4S3UGMIQWPPKI7BM
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Heiner Kallweit <hkallweit1@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andreas Kemnade <andreas@kemnade.info>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] leds: make flash and multicolor dependencies unconditional
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L6G3FGWSPHV55ULK4S3UGMIQWPPKI7BM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 09, 2024 at 10:06:40AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Along the same lines as making devm_led_classdev_register() declared
> extern unconditional, do the same thing for the two sub-classes
> that have similar stubs.
> 
> The users of these interfaces go to great lengths to allow building
> with both the generic leds API and the extended version, but realistically
> there is not much use in this, so just simplify it to always rely
> on it and remove the confusing fallback logic.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/leds/Kconfig                 |  4 ++--
>  drivers/leds/flash/Kconfig           |  4 ++--
>  drivers/staging/greybus/Kconfig      |  2 +-
>  drivers/staging/greybus/light.c      | 21 --------------------
>  include/linux/led-class-flash.h      | 24 -----------------------
>  include/linux/led-class-multicolor.h | 29 ----------------------------
>  6 files changed, 5 insertions(+), 79 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
