Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA66AB96EA
	for <lists+greybus-dev@lfdr.de>; Fri, 16 May 2025 09:53:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A6E2544924
	for <lists+greybus-dev@lfdr.de>; Fri, 16 May 2025 07:53:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 92B1440C78
	for <greybus-dev@lists.linaro.org>; Fri, 16 May 2025 07:53:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Q99XguMI;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B586F5C1364;
	Fri, 16 May 2025 07:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D40DC4CEE4;
	Fri, 16 May 2025 07:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747382004;
	bh=VRYwJvlS/oPkw7h+ANDW8F6S+GBF6RqtdD8q4vdqTUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q99XguMIv33Z+vPyHpN5RT4ep5fNuBUeC0la/By8sXhmPU4UPHIuetCrS4xpRLADt
	 q5knwOmgErP4/Z9JhapU2SZLQWVSAeemiix+yqfSa+CVyCCBN/McF+mnieciyGBhdJ
	 f+nKzCKL6ZazHPm4LN7bTRJ6H/q69zUWyI2dOmbc=
Date: Fri, 16 May 2025 09:51:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2025051612-stained-wasting-26d3@gregkh>
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <2025051551-rinsing-accurate-1852@gregkh>
 <D9WTONSVOPJS.1DNQ703ATXIN1@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9WTONSVOPJS.1DNQ703ATXIN1@silabs.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 92B1440C78
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	RCVD_IN_DNSWL_HI(-0.50)[139.178.84.217:from];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns,microchip.com:url,ti.com:url];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[netdev,dt];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: USDD3KVIXET3Q2XQZU7P5HWBIZ7BDKQ4
X-Message-ID-Hash: USDD3KVIXET3Q2XQZU7P5HWBIZ7BDKQ4
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/USDD3KVIXET3Q2XQZU7P5HWBIZ7BDKQ4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 11:00:39AM -0400, Damien Ri=E9gel wrote:
> On Thu May 15, 2025 at 3:49 AM EDT, Greg Kroah-Hartman wrote:
> > On Wed, May 14, 2025 at 06:52:27PM -0400, Damien Ri=E9gel wrote:
> >> On Tue May 13, 2025 at 5:53 PM EDT, Andrew Lunn wrote:
> >> > On Tue, May 13, 2025 at 05:15:20PM -0400, Damien Ri=E9gel wrote:
> >> >> On Mon May 12, 2025 at 1:07 PM EDT, Andrew Lunn wrote:
> >> >> > On Sun, May 11, 2025 at 09:27:33PM -0400, Damien Ri=E9gel wrote:
> >> >> >> Hi,
> >> >> >>
> >> >> >>
> >> >> >> This patchset brings initial support for Silicon Labs CPC protoc=
ol,
> >> >> >> standing for Co-Processor Communication. This protocol is used b=
y the
> >> >> >> EFR32 Series [1]. These devices offer a variety for radio protoc=
ols,
> >> >> >> such as Bluetooth, Z-Wave, Zigbee [2].
> >> >> >
> >> >> > Before we get too deep into the details of the patches, please co=
uld
> >> >> > you do a compare/contrast to Greybus.
> >> >>
> >> >> Thank you for the prompt feedback on the RFC. We took a look at Gre=
ybus
> >> >> in the past and it didn't seem to fit our needs. One of the main use
> >> >> case that drove the development of CPC was to support WiFi (in
> >> >> coexistence with other radio stacks) over SDIO, and get the maximum
> >> >> throughput possible. We concluded that to achieve this we would need
> >> >> packet aggregation, as sending one frame at a time over SDIO is
> >> >> wasteful, and managing Radio Co-Processor available buffers, as sen=
ding
> >> >> frames that the RCP is not able to process would degrade performanc=
e.
> >> >>
> >> >> Greybus don't seem to offer these capabilities. It seems to be more
> >> >> geared towards implementing RPC, where the host would send a comman=
d,
> >> >> and then wait for the device to execute it and to respond. For Grey=
bus'
> >> >> protocols that implement some "streaming" features like audio or vi=
deo
> >> >> capture, the data streams go to an I2S or CSI interface, but it doe=
sn't
> >> >> seem to go through a CPort. So it seems to act as a backbone to con=
nect
> >> >> CPorts together, but high-throughput transfers happen on other type=
s of
> >> >> links. CPC is more about moving data over a physical link, guarante=
eing
> >> >> ordered delivery and avoiding unnecessary transmissions if remote
> >> >> doesn't have the resources, it's much lower level than Greybus.
> >> >
> >> > As is said, i don't know Greybus too well. I hope its Maintainers can
> >> > comment on this.
> >> >
> >> >> > Also, this patch adds Bluetooth, you talk about Z-Wave and Zigbee=
. But
> >> >> > the EFR32 is a general purpose SoC, with I2C, SPI, PWM, UART. Gre=
ybus
> >> >> > has support for these, although the code is current in staging. B=
ut
> >> >> > for staging code, it is actually pretty good.
> >> >>
> >> >> I agree with you that the EFR32 is a general purpose SoC and exposi=
ng
> >> >> all available peripherals would be great, but most customers buy it=
 as
> >> >> an RCP module with one or more radio stacks enabled, and that's the
> >> >> situation we're trying to address. Maybe I introduced a framework w=
ith
> >> >> custom bus, drivers and endpoints where it was unnecessary, the goa=
l is
> >> >> not to be super generic but only to support coexistence of our radio
> >> >> stacks.
> >> >
> >> > This leads to my next problem.
> >> >
> >> > https://www.nordicsemi.com/-/media/Software-and-other-downloads/Prod=
uct-Briefs/nRF5340-SoC-PB.pdf
> >> > Nordic Semiconductor has what appears to be a similar device.
> >> >
> >> > https://www.microchip.com/en-us/products/wireless-connectivity/bluet=
ooth-low-energy/microcontrollers
> >> > Microchip has a similar device as well.
> >> >
> >> > https://www.ti.com/product/CC2674R10
> >> > TI has a similar device.
> >> >
> >> > And maybe there are others?
> >> >
> >> > Are we going to get a Silabs CPC, a Nordic CPC, a Microchip CPC, a TI
> >> > CPC, and an ACME CPC?
> >> >
> >> > How do we end up with one implementation?
> >> >
> >> > Maybe Greybus does not currently support your streaming use case too
> >> > well, but it is at least vendor neutral. Can it be extended for
> >> > streaming?
> >>
> >> I get the sentiment that we don't want every single vendor to push the=
ir
> >> own protocols that are ever so slightly different. To be honest, I don=
't
> >> know if Greybus can be extended for that use case, or if it's something
> >> they are interested in supporting. I've subscribed to greybus-dev so
> >> hopefully my email will get through this time (previous one is pending
> >> approval).
> >>
> >> Unfortunately, we're deep down the CPC road, especially on the firmware
> >> side. Blame on me for not sending the RFC sooner and getting feedback
> >> earlier, but if we have to massively change our course of action we ne=
ed
> >> some degree of confidence that this is a viable alternative for
> >> achieving high-throughput for WiFi over SDIO. I would really value any
> >> input from the Greybus folks on this.
> >
> > So what you are looking for is a standard way to "tunnel" SDIO over some
> > other physical transport, right?  If so, then yes, please use Greybus as
> > that is exactly what it was designed for.
>=20
> No, we want to use SDIO as physical transport. To use the Greybus
> terminology, our MCUs would act as modules with a single interface, and
> that interface would have "radio" bundles for each of the supported
> stack.
>=20
> So we want to expose our radio stacks in Linux and Greybus doesn't
> define protocols for that, so that's kind of uncharted territories and
> we were wondering if Greybus would be the right tool for that. I hope
> the situation is a bit clearer now.

Yes, greybus does not expose a "wifi" protocol as that is way too device
specific, sorry.

So this just would be like any other normal SDIO wifi device then,
shouldn't be anything special, right?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
