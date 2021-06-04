Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F1539B4EE
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Jun 2021 10:34:04 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A7B5C60FF8
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Jun 2021 08:34:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0E0B561006; Fri,  4 Jun 2021 08:34:01 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3C93A60ECC;
	Fri,  4 Jun 2021 08:33:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BE5C160507
 for <greybus-dev@lists.linaro.org>; Fri,  4 Jun 2021 08:33:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BBFE860E9C; Fri,  4 Jun 2021 08:33:57 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by lists.linaro.org (Postfix) with ESMTPS id 7DDCA60507
 for <greybus-dev@lists.linaro.org>; Fri,  4 Jun 2021 08:33:55 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-60-CDThUlX4PWym1fEgqsJjnA-2; Fri, 04 Jun 2021 09:33:52 +0100
X-MC-Unique: CDThUlX4PWym1fEgqsJjnA-2
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Fri, 4 Jun 2021 09:33:50 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Fri, 4 Jun 2021 09:33:50 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Joe Perches' <joe@perches.com>, 'Alex Elder' <elder@linaro.org>,
 'Manikishan Ghantasala' <manikishanghantasala@gmail.com>, Alex Elder
 <elder@ieee.org>
Thread-Topic: [greybus-dev] [PATCH] staging: greybus: fixed the coding style, 
 labels should not be indented.
Thread-Index: AQHXV7uPElUZ9thDckyuMtjnIAGFwKsCzNHA///2ooCAABDyEP//8ZgAgAC7OdD///UyAAACKTmg
Date: Fri, 4 Jun 2021 08:33:50 +0000
Message-ID: <a3a2712ee54949db9c22269e07f9f2f5@AcuMS.aculab.com>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
 <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
 <e23879ae78404be2b707b550b3029e43@AcuMS.aculab.com>
 <10ad30e2-c906-b210-bf0e-5e20b6de1993@linaro.org>
 <c29b5c97f97b48c894917647915bf510@AcuMS.aculab.com>
 <19651be0dc8706da34658d25195ff122f41ee7c0.camel@perches.com>
In-Reply-To: <19651be0dc8706da34658d25195ff122f41ee7c0.camel@perches.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
 Alex Elder <elder@kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

From: Joe Perches
> Sent: 04 June 2021 09:27
> 
> On Fri, 2021-06-04 at 08:13 +0000, David Laight wrote:
> > From: Alex Elder
> > > Sent: 03 June 2021 22:55
> > ...
> > > Not necessarily, sizeof(bool) is implementation defined.
> > > And I thought you didn't think the size of the structure
> > > was very important...
> >
> > It is 'implementation defined' but will be 32 bits on everything
> > except an old 32bit ARM ABI.
> 
> Really? (x86-64)
> 
...
> sizeof _Bool: 1
> sizeof struct foo: 1

Gah, not enough coffee.
I said I don't like _Bool :-)

The old arm32 must have had 32bit bool.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
