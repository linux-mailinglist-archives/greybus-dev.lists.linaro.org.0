Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CC860682A3C
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Jan 2023 11:16:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 840F144443
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Jan 2023 10:16:09 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id C30823EA18
	for <greybus-dev@lists.linaro.org>; Tue, 31 Jan 2023 10:16:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=JeUCAMho;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A2E2BB81B80;
	Tue, 31 Jan 2023 10:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A54C4339B;
	Tue, 31 Jan 2023 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675160161;
	bh=1pkJs2jkaOkE6Qmfs+EJL7dI3laoOBYaUoEx2DL2DAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeUCAMhotOYwRP97EU1HcJrCThrmOa5XN5RReHodKijjavC31Ovbrsqto0qcNy/Sl
	 y/QCoWqB7nj2mUGjSzyb63xaCRU5hUlSt1dKhEs6mo7Z2608k80HCl7mPZH6nhP499
	 SD1PuTM5tPeXyQziiqU+gvpWyRZEfhfoXMbXxawo=
Date: Tue, 31 Jan 2023 11:15:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Message-ID: <Y9jqXklnj44XiZ93@kroah.com>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
 <20230130-hid-const-ll-driver-v1-9-3fc282b3b1d0@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130-hid-const-ll-driver-v1-9-3fc282b3b1d0@weissschuh.net>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C30823EA18
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[ams.source.kernel.org:helo,ams.source.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,redhat.com,microsoft.com,riseup.net,linux.intel.com,gmail.com,vger.kernel.org,lists.sourceforge.net,lists.linaro.org,lists.linux.dev];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: 5RCGAICDVTZ5GI4XXFFYAHBWKXNR56AZ
X-Message-ID-Hash: 5RCGAICDVTZ5GI4XXFFYAHBWKXNR56AZ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 9/9] staging: greybus: hid: Constify lowlevel HID driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5RCGAICDVTZ5GI4XXFFYAHBWKXNR56AZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 03:59:45AM +0000, Thomas Wei=DFschuh wrote:
> Since commit 52d225346904 ("HID: Make lowlevel driver structs const")
> the lowlevel HID drivers are only exposed as const.
>=20
> Take advantage of this to constify the underlying structure, too.
>=20
> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
